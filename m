Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35182 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbcFCCC7 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Jun 2016 22:02:59 -0400
Date: Thu, 2 Jun 2016 21:02:57 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] hwmon: ina2xx: Document compatible for INA231
Message-ID: <20160603020257.GA23528@rob-hp-laptop>
References: <1464774192-21887-1-git-send-email-k.kozlowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464774192-21887-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 01, 2016 at 11:43:12AM +0200, Krzysztof Kozlowski wrote:
> Document the compatible for INA231 sensor.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ina2xx.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
