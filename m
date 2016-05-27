Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from basicbox7.server-home.net ([195.137.212.29]:50415 "EHLO
	basicbox7.server-home.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932077AbcE0IAJ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 27 May 2016 04:00:09 -0400
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <2fc3a0a0-950d-845c-200d-7a89b57270f6@leemhuis.info>
 <201605261751.47334@pali>
Cc: Jan C Peters <jcpeters89@gmail.com>,
	=?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Thorsten Leemhuis <fedora@leemhuis.info>
Message-ID: <47313829-b0f7-9aca-443f-48ea2bdb7316@leemhuis.info>
Date: Fri, 27 May 2016 10:00:05 +0200
MIME-Version: 1.0
In-Reply-To: <201605261751.47334@pali>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Pali Rohár wrote on 26.05.2016 17:51:
> On Thursday 26 May 2016 17:39:57 Thorsten Leemhuis wrote:
>> > I need to know if this patch fixes problem on Dell Studio XPS 8000
>> > and Dell Studio XPS 8100 machines, so we can revert git commits:
>> > 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000")
>> > a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")
>> Just checked: Sorry, that patch did not fix the CPU fan speed issue
>> on my XPS 8000, so there is afaics no reason to revert 6220f4ebd7b4
>> :-/
> Please, can you apply patch "dell-smm-hwmon: In debug mode log duration 
> of SMM calls" 

On top of "Cache fan_type() calls and use fan_status() for fan 
detection" or with that patch reverted? I did the latter and 
tested with 4.6 (just mentioning it here in case it matters).

> and compile dell-smm-hwmon in debug mode to tell us which 
> SMM call takes too long? This is probably they key for that XPS 
> problems...

[    5.941037] dell_smm_hwmon: smm(0xfea3 0x0000) = 0x4147  (took   14470 usecs)
[    5.941139] dell_smm_hwmon: smm(0x11a3 0x0000) = 0xffff  (took      93 usecs)
[    5.941236] dell_smm_hwmon: smm(0x11a3 0x0001) = 0xffff  (took      93 usecs)
[    5.941331] dell_smm_hwmon: smm(0x11a3 0x0002) = 0xffff  (took      92 usecs)
[    5.941427] dell_smm_hwmon: smm(0x11a3 0x0003) = 0xffff  (took      92 usecs)
[    5.941526] dell_smm_hwmon: smm(0x03a3 0x0000) = 0x0000  (took      95 usecs)
[    5.941625] dell_smm_hwmon: smm(0x03a3 0x0001) = 0x0001  (took      95 usecs)

HTH, CU, knurd
