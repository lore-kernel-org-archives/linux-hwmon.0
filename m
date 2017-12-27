Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:37383 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751320AbdL0DIL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Dec 2017 22:08:11 -0500
Subject: Re: [GIT PULL] hwmon fixes for v4.15-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1514338889-22929-1-git-send-email-linux@roeck-us.net>
 <CA+55aFxUA=jTodPShv7TX3mZMDmwk8YC-D3Q1wq7ZJbnevzD8w@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <58253586-1da5-152f-f6bd-eb9386316165@roeck-us.net>
Date: Tue, 26 Dec 2017 19:08:08 -0800
MIME-Version: 1.0
In-Reply-To: <CA+55aFxUA=jTodPShv7TX3mZMDmwk8YC-D3Q1wq7ZJbnevzD8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/26/2017 06:25 PM, Linus Torvalds wrote:
> On Tue, Dec 26, 2017 at 5:41 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Please pull hwmon fixes for Linux v4.15-rc6 from signed tag:
>>
>>      git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.15-rc6
> 
> Hmm. That was a tag, but not a signed one. It's just a naked tag that
> pointed directly at the commit.
> 
> You *normally* do real signed tags. Did you change your workflow
> somehow this time?
> 
> I've pulled it, since it's kernel.org, but I thought I'd mention this
> discrepancy.
> 

Grumble. Looking into the command history, I didn't push the tag
(which I had signed), I pushed:

git push origin HEAD:refs/tags/hwmon-for-linus-v4.15-rc6

which doesn't really make sense. No idea what I was thinking.
Either I didn't have enough beer last night, or too much. Sorry.

Guenter
