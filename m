Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45625 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496AbcGUWJm (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 21 Jul 2016 18:09:42 -0400
Date: Thu, 21 Jul 2016 15:09:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, lho@apm.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Message-ID: <20160721220935.GB19236@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <1469134557-26869-3-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469134557-26869-3-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jul 21, 2016 at 01:55:56PM -0700, Hoan Tran wrote:
> This patch adds hardware temperature and power reading support for
> APM X-Gene SoC using the mailbox communication interface.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> ---

[ ... ]

> +
> +	dev_info(&pdev->dev, "APM X-Gene SoC HW monitor driver registered\n");
> +
> +	return rc;
> +

Nitpick: rc == 0 here, so return 0; is a better choice.
Otherwise looks good.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Note that I can not apply the patch at this time due to its dependency.

Guenter
