Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Mon, 6 Nov 2017 15:42:09 -0600
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <philipp.zabel@gmail.com>,
	Mykola Kostenok <c_mykolak@mellanox.com>,
	Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
	Patrick Venture <venture@google.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: aspeed-pwm-tacho: Add reset
 node
Message-ID: <20171106214209.o2cu2ndkmz2apc62@rob-hp-laptop>
References: <20171102035349.1902-1-joel@jms.id.au>
 <20171102035349.1902-4-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171102035349.1902-4-joel@jms.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Nov 02, 2017 at 02:53:49PM +1100, Joel Stanley wrote:
> The device tree bindings are updated to document the resets phandle, and
> the example is updated to match what is expected for both the reset and
> clock phandle.
> 
> Note that the bindings should have always had the reset controller, as
> the hardware is unusable without it.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt         | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
