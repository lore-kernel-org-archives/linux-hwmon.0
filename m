Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:35891 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932632AbcE3JgQ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 30 May 2016 05:36:16 -0400
Date: Mon, 30 May 2016 11:36:13 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Peter Saunderson <peteasa@gmail.com>
Cc: Thorsten Leemhuis <fedora@leemhuis.info>,
	Jan C Peters <jcpeters89@gmail.com>,
	David =?utf-8?Q?Santamar=C3=ADa?= Rogado <howl.nsp@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
Message-ID: <20160530093613.GS29844@pali>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <201605271245.47383@pali>
 <01084692-618a-31db-76f8-60176d1cd2cc@leemhuis.info>
 <201605271521.10294@pali>
 <574B4293.9010404@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <574B4293.9010404@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sunday 29 May 2016 20:27:15 Peter Saunderson wrote:
> I have just tested removing i8k_get_fan_type() function from the
> dell-smm-hwmon driver in the kernel on my Dell Inspiron 580 and the fan
> speed problem goes away.  My patch simply replaced fan_type with fan_status
> in i8k_init_hwmon and used the index as the type in i8k_hwmon_show_fan_label
> since index and the type were the same numerical value on my machine.
> 
> Removing i8k_get_fan_type() function for Dell Inspiron 580 would be a very
> good fix!  Well done for finding it!
> 
> On 27/05/16 14:21, Pali Rohár wrote:
> >So, once kernel call i8k_get_fan_type() function, then fan speed going
> >up/down? Even if it was called only at once? Can you confirm it? Caching
> >patch cause that for each fan that function is called exactly one time.
> Yes even if the i8k_get_fan_type() function is called once I get the fan
> speed problem.
> >If this is problem, we can probably create DMI list of machines which do
> >not like i8k_get_fan_type() call and disable it for them.
> Please add Dell Inspiron 580 to any blacklist that you create.  The
> DMI_PRODUCT_NAME seems to have a white space at the end:
> 
> 	{
> 		/*
> 		 * CPU fan speed going up and down on Dell Inspiron 580
> 		 * for unknown reasons.
> 		 */
> 		.ident = "Dell Inspiron 580",
> 		.matches = {
> 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Inspiron 580 "),
> 		},
> 	},
> 
> 
> 

Hi Peter! Thank you for information! Are you able to try to call that
function on some old kernel (e.g. 3.12 or 3.14) to verify that it is
caused only and only by that function?

-- 
Pali Rohár
pali.rohar@gmail.com
