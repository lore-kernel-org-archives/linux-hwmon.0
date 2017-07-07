Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Fri, 7 Jul 2017 09:24:46 -0500
From: Rob Herring <robh@kernel.org>
To: Tom Levens <tom.levens@cern.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: ltc2990: add devicetree binding
Message-ID: <20170707142446.bmksujm745mzpc4f@rob-hp-laptop>
References: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
 <1499056140-6064-2-git-send-email-tom.levens@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499056140-6064-2-git-send-email-tom.levens@cern.ch>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Jul 03, 2017 at 06:28:59AM +0200, Tom Levens wrote:
> Add a devicetree binding for the ltc2990 hwmon driver.

Bindings are for a device, not a Linux driver.

> 
> Signed-off-by: Tom Levens <tom.levens@cern.ch>
> ---
>  .../devicetree/bindings/hwmon/ltc2990.txt          | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2990.txt

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
