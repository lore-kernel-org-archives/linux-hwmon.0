Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54490 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975AbcFJQom (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 10 Jun 2016 12:44:42 -0400
Date: Fri, 10 Jun 2016 09:44:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Andrew F. Davis" <afd@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] hwmon: Add support for INA3221 Triple
 Current/Voltage Monitors
Message-ID: <20160610164435.GA9125@roeck-us.net>
References: <20160610153233.6169-1-afd@ti.com>
 <20160610153233.6169-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160610153233.6169-2-afd@ti.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 10, 2016 at 10:32:33AM -0500, Andrew F. Davis wrote:
> Add support for the the INA3221 26v capable, Triple channel,
> Bi-Directional, Zero-Drift, Low-/High-Side, Current/Voltage Monitor
> with I2C interface.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Applied to -next.

Can you by any chance send me a register dump ? I would like to write
module test code for the chip.

Thanks,
Guenter
