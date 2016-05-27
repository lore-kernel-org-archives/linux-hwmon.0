Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from basicbox7.server-home.net ([195.137.212.29]:44490 "EHLO
	basicbox7.server-home.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727AbcE0KBZ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 27 May 2016 06:01:25 -0400
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <2fc3a0a0-950d-845c-200d-7a89b57270f6@leemhuis.info>
 <201605261751.47334@pali>
 <47313829-b0f7-9aca-443f-48ea2bdb7316@leemhuis.info>
 <20160527094736.GL29844@pali>
Cc: Jan C Peters <jcpeters89@gmail.com>,
	=?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Thorsten Leemhuis <fedora@leemhuis.info>
Message-ID: <10b66444-9405-9d4c-b1ec-ce57f7e8420f@leemhuis.info>
Date: Fri, 27 May 2016 12:01:21 +0200
MIME-Version: 1.0
In-Reply-To: <20160527094736.GL29844@pali>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Pali Rohár wrote on 27.05.2016 11:47:
> On Friday 27 May 2016 10:00:05 Thorsten Leemhuis wrote:
>> Pali Rohár wrote on 26.05.2016 17:51:
>> > On Thursday 26 May 2016 17:39:57 Thorsten Leemhuis wrote:
>> >> > I need to know if this patch fixes problem on Dell Studio XPS 8000
>> >> > and Dell Studio XPS 8100 machines, so we can revert git commits:
>> >> > 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000")
>> >> > a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")
>> >> Just checked: Sorry, that patch did not fix the CPU fan speed issue
>> >> on my XPS 8000, so there is afaics no reason to revert 6220f4ebd7b4
>> >> :-/
>> > Please, can you apply patch "dell-smm-hwmon: In debug mode log duration 
>> > of SMM calls" 
> […] 
> I do not see any long taking SMM call here. Are you really sure that
> your machine freeze when loading or using dell-smm-hwmon?

Uhh, sorry, it seems something got mixed up somewhere. As mentioned
earlier in this thread already: The Studio XPS 8000 I have here never
froze when loading or using dell-smm-hwmon. I only saw its CPU fan speed
going up and down as described in
https://bugzilla.kernel.org/show_bug.cgi?id=100121 From the mail that
started this thread I got the impression that all those problems are all
related somehow, so I went testing the patch as asked.

CU, knurd
