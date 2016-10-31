Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:35987 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759574AbcJaGE7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2016 02:04:59 -0400
Date: Mon, 31 Oct 2016 01:04:56 -0500
From: Rob Herring <robh@kernel.org>
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (mcp3021) add devicetree bindings
 documentation
Message-ID: <20161031060456.2a3b2mekmbwwycl3@rob-hp-laptop>
References: <20161027223345.16733-1-clemens.gruber@pqgruber.com>
 <20161027223345.16733-2-clemens.gruber@pqgruber.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161027223345.16733-2-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 28, 2016 at 12:33:44AM +0200, Clemens Gruber wrote:
> Document the devicetree bindings for the Microchip MCP3021/3221.
> 
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> ---
>  Documentation/devicetree/bindings/hwmon/mcp3021.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt

Acked-by: Rob Herring <robh@kernel.org>
