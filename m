Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33468 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751687AbcGPT2v (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 16 Jul 2016 15:28:51 -0400
Date: Sat, 16 Jul 2016 14:28:49 -0500
From: Rob Herring <robh@kernel.org>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Duc Dang <dhdang@apm.com>, lho@apm.com
Subject: Re: [PATCH v2 1/3] Documentation: dtb: xgene: Add hwmon dts binding
 documentation
Message-ID: <20160716192849.GA12635@rob-hp-laptop>
References: <1468283416-12780-1-git-send-email-hotran@apm.com>
 <1468283416-12780-2-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1468283416-12780-2-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jul 11, 2016 at 05:30:14PM -0700, Hoan Tran wrote:
> This patch adds the APM X-Gene hwmon device tree node documentation.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> ---
>  .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt

Acked-by: Rob Herring <robh@kernel.org>
