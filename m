Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-by2on0099.outbound.protection.outlook.com ([207.46.100.99]:33128
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750727AbcFAQJ4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jun 2016 12:09:56 -0400
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Borislav Petkov <bp@alien8.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"Hurwitz, Sherry" <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Date: Wed, 1 Jun 2016 15:35:23 +0000
Message-ID: <A3FEFDCF-9AE5-4C0B-B36E-E46A87F7229C@amd.com>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>,<574EE1B3.9010704@roeck-us.net>,<5FE1E570-430B-4C0D-9100-E213D5B5ACFA@amd.com>
In-Reply-To: <5FE1E570-430B-4C0D-9100-E213D5B5ACFA@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Sent from my iPad

> On Jun 1, 2016, at 11:27 PM, Huang, Ray <Ray.Huang@amd.com> wrote:
> 
> 
> 
>>> On Jun 1, 2016, at 9:23 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>> 
>>> On 06/01/2016 03:04 AM, Borislav Petkov wrote:
>>> From: Borislav Petkov <bp@suse.de>
>>> 
>>> We need to read a bunch of registers on each compute unit and possibly
>>> on the current CPU too. Disable preemption around it.
>> 
>> An explanation would be helpful. Is this a bug fix ? I would like to get
>> a confirmation from someone at AMD that this is really necessary.
>> 
> 
> This change looks good for me. But I am in office this week, I will test it on CZ platform next week.   :-)

Sorry, fix typo. I am *not* in office this week.

Rui