Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:38955 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753378AbdKXLZq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 06:25:46 -0500
Date: Fri, 24 Nov 2017 12:25:43 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Jean Delvare <jdelvare@suse.de>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: i8k_smm_func() takes enormous of time to execute
Message-ID: <20171124112543.3css4fwwmbiu36bm@pali>
References: <12093169.Rm9IG5ILEB@natalenko.name>
 <1511518948.15084.9.camel@suse.de>
 <2197616.V8s6m9LJcd@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2197616.V8s6m9LJcd@natalenko.name>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Friday 24 November 2017 12:17:30 Oleksandr Natalenko wrote:
> > There are two patches waiting to be tested in
> > https://bugzilla.kernel.org/show_bug.cgi?id=195751
> 
> Tested and attached a couple of patches on top of those to the BZ. If 
> disabling fan control is the only approach here, I can confirm that this 
> works.

Hi! Please figure out which SMM call (they are identified by eax and ebx
registers) cause this freeze. So we would now what needs to be
blacklisted.

-- 
Pali Rohár
pali.rohar@gmail.com
