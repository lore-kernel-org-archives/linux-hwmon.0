Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40696 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbeJaMhk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 08:37:40 -0400
Subject: Re: [PATCH] hwmon: (adt7475) document mapping of sysfs entries to
 inputs
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20181030202527.14581-1-chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <092d62bc-8919-bb18-c377-57e3b7018c17@roeck-us.net>
Date: Tue, 30 Oct 2018 20:41:23 -0700
MIME-Version: 1.0
In-Reply-To: <20181030202527.14581-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/30/18 1:25 PM, Chris Packham wrote:
> As per the usual standard with hwmon drivers the mapping to sysfs
> entries follows the register map of the device e.g. in0_input
> corresponds to the register 0x20, in1_input corresponds to 0x21 etc.
> 
> Hardware designers tend to work with input pins instead of registers
> which is where things start to get confusing. A hardware designer might
> say "the 1.5V rail is connected to the VCCP pin" leaving the software
> designer none the wiser as to which of the sysfs entries should be
> associated with the label "1.5V".
> 
> Try to bridge the gap by documenting the mapping of sysfs entries to
> the corresponding pins. This should allow someone to create a
> configuration file or other mapping without needing to dive into the
> code and ADT datasheets.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to hwmon-next.

Thanks,
Guenter
