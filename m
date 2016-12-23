Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39318 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758431AbcLWT2D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Dec 2016 14:28:03 -0500
Subject: Re: [GIT PULL] hwmon updates for v4.10 (take 2)
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <1482432934-22961-1-git-send-email-linux@roeck-us.net>
 <CA+55aFympX7vK9+RqdG-20sAyFNsTv+jtQDuR2kz7ApWMGedyg@mail.gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8fa4bce2-6bd7-8eee-91e7-5b7cb3885549@roeck-us.net>
Date: Fri, 23 Dec 2016 11:27:58 -0800
MIME-Version: 1.0
In-Reply-To: <CA+55aFympX7vK9+RqdG-20sAyFNsTv+jtQDuR2kz7ApWMGedyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/23/2016 10:35 AM, Linus Torvalds wrote:
> On Thu, Dec 22, 2016 at 10:55 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> As mentioned in the tag, this patch series was auto-generated using coccinelle.
>> I would like to have it applied either now or right after -rc1, at your
>> preference.
>
> My preference is to not apply it at all.
>
> Several of the commit messages I looked at were actively misleading,
> talking about the coccinelle transformation for the RO case, but then
> the patch itself was actually RW.
>
> I'm not going to bother with this kind of broken thing the day before
> xmas eve.
>
> This will not be pulled.
>

Ok, fair enough. I'll clean it up and wait for the next window.

Guenter

