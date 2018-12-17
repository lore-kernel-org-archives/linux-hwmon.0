Return-Path: <olysonek@redhat.com>
Subject: Re: libsensors soname bump
To: lordheavym@gmail.com
Cc: Aurelien Jarno <aurelien@aurel32.net>, Jean Delvare <jdelvare@suse.de>,
 linux-hwmon@vger.kernel.org
References: <20181216124344.49d06b69@endymion>
 <514c8587-ccf3-f7af-b88d-744add6f1da2@redhat.com>
 <3799b201-38f9-d74f-273d-f819736dcfb6@redhat.com>
 <20181217115902.15e538fe@endymion>
 <20181217112713.jvobrvrmxpkfeshi@aurel32.net>
From: =?UTF-8?Q?Ond=c5=99ej_Lyson=c4=9bk?= <olysonek@redhat.com>
Message-ID: <c9cf6e23-696b-7d72-87be-8a3ee70afa2d@redhat.com>
Date: Mon, 17 Dec 2018 12:48:04 +0100
MIME-Version: 1.0
In-Reply-To: <20181217112713.jvobrvrmxpkfeshi@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Laurent,

I see that you're the lm_sensors maintainer in Arch Linux. I understand
you recently upgraded lm_sensors to 3.5.0 in Arch, while keeping the
upstream soname change of libsensors to libsensors.so.5.

As the soname change was undue, we're currently considering reverting it
(see below, the whole thread should be available on spinics [1]). Would
that pose a major problem for you? Have the dependent packages in Arch
already been rebuilt?

Thanks!

[1] https://www.spinics.net/lists/linux-hwmon/msg04837.html

Best regards
Ondřej Lysoněk

On 17. 12. 18 12:27, Aurelien Jarno wrote:
> On 2018-12-17 11:59, Jean Delvare wrote:
>> On Mon, 17 Dec 2018 11:35:46 +0100, Ondřej Lysoněk wrote:
>>> I mean, I would love to revert the soname change, however doing so now
>>> seems like a bad thing to do - people may have already adopted
>>> lm_sensors 3.5.0. So I'd like to avoid reverting the change unless there
>>> is a good justification to do so.
>>
>> It's not in Debian yet:
>> https://packages.debian.org/sid/lm-sensors
> 
> It's available in the experimental suite with the soname change:
> https://packages.debian.org/experimental/lm-sensors
> 
> And it's waiting for a transition slot to rebuild all the
> reverse dependencies in sid:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=915790
> 
> So on the Debian side, there is still time to revert the soname change.
> 
> Aurelien
> 
