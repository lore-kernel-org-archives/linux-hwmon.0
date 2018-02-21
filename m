Return-Path: <andrew@lunn.ch>
Return-path: <andrew@lunn.ch>
Date: Wed, 21 Feb 2018 18:13:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
	gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
	benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180221171349.GG29204@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Feb 21, 2018 at 08:16:00AM -0800, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document of PECI adapter driver for Aspeed
> AST24xx/25xx SoCs.

Hi Jae

It would be good to separate this into two. One binding document for a
generic adaptor, with a generic PECI bus, and generic client
devices. List all the properties you expect at the generic level.

Then have an aspeed specific binding for those properties which are
specific to the Aspeed adaptor.

	 Andrew
 
