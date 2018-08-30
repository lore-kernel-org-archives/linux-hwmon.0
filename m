Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33568 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbeH3EmF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Aug 2018 00:42:05 -0400
Subject: Re: [GIT PULL] hwmon fixes for v4.19-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1535574760-11636-1-git-send-email-linux@roeck-us.net>
 <CA+55aFzUVOKJgXpfUEwC2eK7mNhhJktse=Dbrwh0x8AmUxwEcQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c8a7c16a-59bc-4e4c-4d2d-2cf8715257ff@roeck-us.net>
Date: Wed, 29 Aug 2018 17:42:34 -0700
MIME-Version: 1.0
In-Reply-To: <CA+55aFzUVOKJgXpfUEwC2eK7mNhhJktse=Dbrwh0x8AmUxwEcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/29/2018 04:07 PM, Linus Torvalds wrote:
> On Wed, Aug 29, 2018 at 1:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Please pull hwmon fixes for Linux v4.19-rc2 from signed tag:
> 
> That actually isn't a signed tag at all, it's just a bare tag (ie just
> directly points to the commit).
> 

Oops, sorry.

> I guess I don't care *that* much, since it's from kernel.org, but you
> should check what happened to your workflow. *Normally* you do
> actually have signed tags.
> 

Nothing special, just busy tracking down build/boot failures and such.
I tag manually, and forgot the "-s".

Guenter
