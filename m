Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:40757 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752735AbeB1SxM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Feb 2018 13:53:12 -0500
Date: Wed, 28 Feb 2018 19:53:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org
Subject: Re: [RFC 2/4] mfd: add Gateworks System Controller core driver
Message-ID: <20180228185302.GD1203@lunn.ch>
References: <1519780874-8558-1-git-send-email-tharvey@gateworks.com>
 <1519780874-8558-3-git-send-email-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519780874-8558-3-git-send-email-tharvey@gateworks.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

> +		dev_err(&client->dev, ">> 0x%02x %d\n", reg, ret);
> +		return ret;
> +	}
> +	dev_dbg(&client->dev, ">> 0x%02x=0x%02x (%d)\n", reg, val, retry);
> +
> +        return 0;

Hi Tim

There appears to be a few spaces vs tabs issues in this file.

      Andrew
 
