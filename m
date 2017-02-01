Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35554 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753032AbdBARew (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Feb 2017 12:34:52 -0500
Date: Wed, 1 Feb 2017 11:34:50 -0600
From: Rob Herring <robh@kernel.org>
To: eajames@linux.vnet.ibm.com
Cc: linux@roeck-us.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        mark.rutland@arm.com, wsa@the-dreams.de, andrew@aj.id.au,
        joel@jms.id.au, benh@kernel.crashing.org,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH linux v5 5/6] hwmon: occ: Add hwmon implementation for
 the P8 OCC
Message-ID: <20170201173450.ysuk3j2hwoldz72o@rob-hp-laptop>
References: <1485877437-13598-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jan 31, 2017 at 09:43:56AM -0600, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
> well as probe the entire driver from the I2C bus. I2C is the communication
> method between the BMC and the P8 OCC.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +++

Please add acks when posting new versions.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/hwmon/occ/Kconfig                       |  14 ++++
>  drivers/hwmon/occ/Makefile                      |   1 +
>  drivers/hwmon/occ/p8_occ_i2c.c                  | 104 ++++++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
>  create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c
