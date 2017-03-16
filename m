Return-path: <d.mueller@elsoft.ch>
Subject: Re: [PATCH linux v4 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
References: <20170311015351.23092-1-jaghu@google.com>
 <20170311015351.23092-2-jaghu@google.com>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Message-ID: <6c028b76-ccc3-46ba-7a41-fa1b7b4a5b77@elsoft.ch>
Date: Thu, 16 Mar 2017 09:05:31 +0100
MIME-Version: 1.0
In-Reply-To: <20170311015351.23092-2-jaghu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Hello

Jaghathiswari Rankappagounder Natarajan wrote:

> +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400
> or +	       "aspeed,aspeed2500-pwm-tacho" for AST2500.

Shouldn't this be "aspeed,ast2400-pwm-tacho" and
"aspeed,ast2500-pwm-tacho", as this is the naming scheme used for all
the other AST2x00 devices currently present in "aspeed-g[45].dtsi"?

Dave
