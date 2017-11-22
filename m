Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:42670 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751571AbdKVPWj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Nov 2017 10:22:39 -0500
Date: Wed, 22 Nov 2017 07:22:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v3, 09/12] hwmon (occ): Add sensor attributes and register
 hwmon device
Message-ID: <20171122152237.GA20324@roeck-us.net>
References: <1511222021-562-10-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511222021-562-10-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 20, 2017 at 05:53:38PM -0600, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Setup the sensor attributes for every OCC sensor found by the first poll
> response. Register the attributes with hwmon. Add hwmon documentation
> for the driver.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 450 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/common.h |  15 ++

I seem to be missing the documentation.

Documentation/hwmon/submitting-patches:

* Document the driver in Documentation/hwmon/<driver_name>.

* Do not create non-standard attributes unless really needed. If you have to use
  non-standard attributes, or you believe you do, discuss it on the mailing list
  first. Either case, provide a detailed explanation why you need the
  non-standard attribute(s).
  Standard attributes are specified in Documentation/hwmon/sysfs-interface.

I really would expect a detailed explanation and, even more so,
documentation for all the non-standard attributes you are adding.

power%d_update_time
power%d_update_tag
power%d_accumulator

really need to be documented, you really need to explain the need for those
attributes. To me they don't mean anything.

Note that you'd probably be much better off using
devm_register_hwmon_with_info() nowadays, but i'll leave that for you to
decide.

Guenter
