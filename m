Return-path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>, lho@apm.com, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Date: Wed, 07 Sep 2016 23:41:44 +0200
Message-ID: <13081573.BbD3TmEU5Y@wuerfel>
In-Reply-To: <1469134557-26869-3-git-send-email-hotran@apm.com>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <1469134557-26869-3-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-hwmon@vger.kernel.org>

On Thursday, July 21, 2016 1:55:56 PM CEST Hoan Tran wrote:
> +               ctx->comm_base_addr = cppc_ss->base_address;
> +               if (ctx->comm_base_addr) {
> +                       ctx->pcc_comm_addr =
> +                                       acpi_os_ioremap(ctx->comm_base_addr,
> +                                                       cppc_ss->length);
> 

This causes the arm64 allmodconfig build to fail now, according to
kernelci:

      1  ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!

Should this perhaps call ioremap() or memremap() instead?

	Arnd
