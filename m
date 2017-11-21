Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:37905 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751251AbdKUSef (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Nov 2017 13:34:35 -0500
Date: Tue, 21 Nov 2017 12:34:32 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, corbet@lwn.net,
        mark.rutland@arm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH v3 03/12] dt-bindings: i2c: Add P8 OCC hwmon device
 documentation
Message-ID: <20171121183432.53ndwjf3czzehwtf@rob-hp-laptop>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1511222021-562-4-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511222021-562-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 20, 2017 at 05:53:32PM -0600, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Document the bindings for I2C-based OCC hwmon device.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt

Acked-by: Rob Herring <robh@kernel.org>
