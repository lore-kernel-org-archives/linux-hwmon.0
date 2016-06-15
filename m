Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36119 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753154AbcFOIDv (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 15 Jun 2016 04:03:51 -0400
Date: Wed, 15 Jun 2016 10:03:48 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	David =?utf-8?Q?Santamar=C3=ADa?= Rogado <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
Message-ID: <20160615080348.GJ29844@pali>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <5740FB24.80709@roeck-us.net>
 <201605220228.00665@pali>
 <201606132052.22116@pali>
 <575F65A6.5070700@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <575F65A6.5070700@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Monday 13 June 2016 19:02:14 Guenter Roeck wrote:
> >And second question: how to fix second bug? I see only one option:
> >Create machine blacklist with broken Dell SMM firmware and disallow
> >calling I8K_SMM_GET_FAN_TYPE for them.
> >
> Or maybe a whitelist with known working systems ?
> 
> Guenter

Smaller list is better, so I will try to collect blacklist and if it
will be big we can use whitelist.

-- 
Pali Rohár
pali.rohar@gmail.com
