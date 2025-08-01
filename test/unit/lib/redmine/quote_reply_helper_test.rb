# frozen_string_literal: true

# Redmine - project management software
# Copyright (C) 2006-  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require_relative '../../../test_helper'

class QuoteReplyHelperTest < ActionView::TestCase
  include ERB::Util
  include Redmine::QuoteReply::Helper

  def test_quote_reply_button
    with_locale 'en' do
      url = quoted_issue_path(issues(:issues_001))

      html = quote_reply_button(url: url)
      assert_select_in html,
        'a[data-quote-reply-url-param=?][data-quote-reply-text-formatting-param=?]:not([title])',
        url, Setting.text_formatting

      # When icon_only is true
      html = quote_reply_button(url: url, icon_only: true)
      assert_select_in html, 'a.icon-only.icon-quote[title=?]', 'Quote'
    end
  end
end
