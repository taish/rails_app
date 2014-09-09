module Scraper
  class BaseScraper
    require 'selenium-webdriver'
    attr_accessor :driver

    def initialize(*args)
      @driver = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(timeout: 10)
      @last_find_element_option = nil
    end

    def get(url)
      @driver.navigate.to(url)
      # wait_next_page
    end

    def quit
      @driver.quit
    end

    def find_element(option)
      @last_find_element_option = option
      element = wait_until { @driver.find_element(option) }
      return element
    end

    def find_elements(option)
      @last_find_element_option = option
      # wait_until { is_readystate_complete? }
      @driver.find_elements(option)
    end

    def wait_until
      begin
        @wait.until { yield } rescue raise RuntimeError, "Cannot find an element with find_element(" + @last_find_element_option.to_s + ")."
      end
    end

    def fill(option, content)
      @focus = find_element(option)
      @focus.send_keys(content)
    end

    def click(option)
      find_element(option).click
    end

    def scroll_element(myelement)
      # chromedriverのバグ。強制的にスクロールさせる
      # http://stackoverflow.com/questions/11908249/debugging-element-is-not-clickable-at-point-error
      @driver.execute_script "window.scrollTo(#{myelement.location.x},#{myelement.location.y})"
      myelement
    end

    def scroll_bottom
      @driver.execute_script "window.scrollBy(0,100000)"
    end


    def is_readystate_complete?
      @driver.execute_script("return document.readyState") == "complete"
    end

    def click_text(text, tag_name=nil)
      if tag_name
        find_element({xpath: "//#{tag_name}[text()[contains(.,\"#{text}\")]]"}).click
      else
        find_element({partial_link_text: text}).click
      end
    end

    def click_link(attr, val)
      find_element({xpath: "//a[@#{attr}=\"#{val}\"]"}).click
    end
  end
end
