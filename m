From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Thu, 31 Mar 2016 02:11:05 -0700
Subject: Re: [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource Chip
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160331091001.GN3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 30 Mar 2016, Mark Brown wrote:
> On Wed, Mar 30, 2016 at 03:52:39PM +0100, Lee Jones wrote:
> > On Wed, 30 Mar 2016, Thor Thayer wrote:
> 
> > > The read register has a different address than the write register
> > > which is handled in this function with the masks (read address is
> > > odd, write address is even).
> 
> > Mark, do we have an API which handled such a configuration?
> 
> No, but it sounds like this is a regmap with seven bit register values
> and a read/write bit which should be using read_flag_mask rather than
> trying to treat these as separate registers.

Nice one.  Thanks Mark.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
