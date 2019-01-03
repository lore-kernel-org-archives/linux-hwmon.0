Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it1-f193.google.com ([209.85.166.193]:52117 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfACW6J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Jan 2019 17:58:09 -0500
Date: Thu, 3 Jan 2019 16:58:06 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 2/2] devicetree: hwmon: Add bindings documentation for
 HIH6130
Message-ID: <20190103225806.GA15255@bogus>
References: <20181227151349.29753-1-andreas@kemnade.info>
 <20181227151349.29753-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181227151349.29753-3-andreas@kemnade.info>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 27 Dec 2018 16:13:49 +0100, Andreas Kemnade wrote:
> Add bindings documentation for HIH6130 driver.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/hwmon/hih6130.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/hih6130.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
