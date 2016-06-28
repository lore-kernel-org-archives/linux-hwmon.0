Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45137 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050AbcF1Buo (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 27 Jun 2016 21:50:44 -0400
Subject: Re: [PATCH] hwmon: (jc42) Add support for Microchip MCP9808
 temperature sensor
To: Alison Schofield <amsfield22@gmail.com>
References: <20160628002319.GA5474@d830.WORKGROUP>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@gmail.com
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5771D7DD.9090503@roeck-us.net>
Date: Mon, 27 Jun 2016 18:50:21 -0700
MIME-Version: 1.0
In-Reply-To: <20160628002319.GA5474@d830.WORKGROUP>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/27/2016 05:23 PM, Alison Schofield wrote:
> MCP9808 is not officially compliant to JC-42, similar to MCP9804,
> but its registers are compatible to JC-42.
>
> Signed-off-by: Alison Schofield <amsfield22@gmail.com>
> Cc: Daniel Baluta <daniel.baluta@gmail.com>

Applied to -next.

Thanks,
Guenter

