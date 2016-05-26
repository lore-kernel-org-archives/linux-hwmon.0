Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34319 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450AbcEZQur (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 26 May 2016 12:50:47 -0400
Received: by mail-ig0-f194.google.com with SMTP id b4so2346216igl.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2016 09:50:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+55aFwPAt66=C3OwqH4HJTv8DQeMjsiNaghNd5gMYdsx=ZyGg@mail.gmail.com>
References: <20160526111219.0f8c0341@endymion>
	<CA+55aFwPAt66=C3OwqH4HJTv8DQeMjsiNaghNd5gMYdsx=ZyGg@mail.gmail.com>
Date: Thu, 26 May 2016 09:50:46 -0700
Message-ID: <CA+55aFyA9VJ_=R_7VuPVbXtqV6Lig=YMMM-PohsxEhteKgfT2g@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for Linux 4.7
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, May 26, 2016 at 9:46 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, May 26, 2016 at 2:12 AM, Jean Delvare <jdelvare@suse.de> wrote:
>> Hi Linus,
>>
>> Please pull hwmon subsystem updates for Linux 4.7 from:
>>
>>  Documentation/hwmon/max34440 | 6 +++---
>>  drivers/hwmon/emc2103.c      | 2 +-
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> From where?

Ok, seems to be the usual place at

    git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging
hwmon-for-linus

however, please fix whatever workflow bug that made that not be part
of the pull request.

          Linus
