Return-path: <robherring2@gmail.com>
Date: Tue, 23 Aug 2016 13:05:25 -0500
From: Rob Herring <robh@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: devicetree@vger.kernel.org, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max6650.c) Add devicetree support documentation
Message-ID: <20160823180524.GA2280@rob-hp-laptop>
References: <1471848272-3032-1-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471848272-3032-1-git-send-email-mike.looijmans@topic.nl>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Aug 22, 2016 at 08:44:32AM +0200, Mike Looijmans wrote:
> This adds the devicetree binding documentation for the max6650 fan
> controller.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Allow only 12V or 5V supply voltage
>  .../devicetree/bindings/hwmon/max6650.txt          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max6650.txt

Acked-by: Rob Herring <robh@kernel.org>
