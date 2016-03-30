From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 01:14:43 -0700
Subject: Re: [RFC] Addition of Altera Arria10 System Resource Chip
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160330081414.GE3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:

You need to submit this properly, using `git send-email`, since it
will look after you by listing each patch, together with their author,
and provide a nice diff-stat, which is very helpful to reviewers.

> The Altera Arria10 Development Kit includes a system resource chip
> that fits under the Multi-Function Device framework. The chip has
> hardware monitoring functions and a GPIO expander over the SPI bus.
> 
> [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip
> [RFC 2/8] MAINTAINERS: Addition of Altera Arria10 System Resource
> [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource
> [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO
> [RFC 5/8] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
> [RFC 6/8] ARM: socfpga: dts: Add LED framework to A10-SR GPIO
> [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
> [RFC 8/8] ARM: socfpga: dts: Add Devkit Arria10-SR HWMON

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
