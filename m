From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Mon, 09 May 2016 08:56:54 -0700
Subject: Re: [PATCH 09/11] mfd: altr_a10sr: Add Altera A10-SR power supply alarms
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160509155616.GE19473@dell>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, 09 May 2016, Lee Jones wrote:

> On Fri, 22 Apr 2016, ttha...@opensource.altera.com wrote:
> 
> > From: Thor Thayer <ttha...@opensource.altera.com>
> > 
> > Add support for power supply alarms to the Altera Arria10
> > Development Kit System Resource chip.
> > 
> > Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> > ---
> >  drivers/mfd/altera-a10sr.c       |    4 ++++
> >  include/linux/mfd/altera-a10sr.h |   24 ++++++++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> 
> For my own reference:
>   Acked-by: Lee Jones <lee.jo...@linaro.org>

Change of plan, this should really be squashed into patch 3.

> > diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
> > index 2ff08e3..2b2a90c 100644
> > --- a/drivers/mfd/altera-a10sr.c
> > +++ b/drivers/mfd/altera-a10sr.c
> > @@ -31,6 +31,10 @@ static const struct mfd_cell altr_a10sr_subdev_info[] = {
> >             .name = "altr_a10sr_gpio",
> >             .of_compatible = "altr,a10sr-gpio",
> >     },
> > +   {
> > +           .name = "altr_a10sr_hwmon",
> > +           .of_compatible = "altr,a10sr-hwmon",
> > +   },
> >  };
> >  
> >  static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
> > diff --git a/include/linux/mfd/altera-a10sr.h 
> > b/include/linux/mfd/altera-a10sr.h
> > index c869fe7..22aa830 100644
> > --- a/include/linux/mfd/altera-a10sr.h
> > +++ b/include/linux/mfd/altera-a10sr.h
> > @@ -62,8 +62,32 @@
> >  #define ALTR_A10SR_IN_VALID_RANGE_HI      15
> >  
> >  #define ALTR_A10SR_PWR_GOOD1_REG      0x08    /* Power Good1 Read */
> > +/* Power Good #1 Register Bit Definitions */
> > +#define ALTR_A10SR_PG1_OP_FLAG_SHIFT    7       /* Power On Complete */
> > +#define ALTR_A10SR_PG1_1V8_SHIFT        6       /* 1.8V Power Good */
> > +#define ALTR_A10SR_PG1_2V5_SHIFT        5       /* 2.5V Power Good */
> > +#define ALTR_A10SR_PG1_3V3_SHIFT        4       /* 3.3V Power Good */
> > +#define ALTR_A10SR_PG1_5V0_SHIFT        3       /* 5.0V Power Good */
> > +#define ALTR_A10SR_PG1_0V9_SHIFT        2       /* 0.9V Power Good */
> > +#define ALTR_A10SR_PG1_0V95_SHIFT       1       /* 0.95V Power Good */
> > +#define ALTR_A10SR_PG1_1V0_SHIFT        0       /* 1.0V Power Good */
> > +
> >  #define ALTR_A10SR_PWR_GOOD2_REG      0x0A    /* Power Good2 Read */
> > +/* Power Good #2 Register Bit Definitions */
> > +#define ALTR_A10SR_PG2_HPS_SHIFT        7       /* HPS Power Good */
> > +#define ALTR_A10SR_PG2_HL_HPS_SHIFT     6       /* HILOHPS_VDD Power Good 
> > */
> > +#define ALTR_A10SR_PG2_HL_VDD_SHIFT     5       /* HILO VDD Power Good */
> > +#define ALTR_A10SR_PG2_HL_VDDQ_SHIFT    4       /* HILO VDDQ Power Good */
> > +#define ALTR_A10SR_PG2_FMCAVADJ_SHIFT   3       /* FMCA VADJ Power Good */
> > +#define ALTR_A10SR_PG2_FMCBVADJ_SHIFT   2       /* FMCB VADJ Power Good */
> > +#define ALTR_A10SR_PG2_FAC2MP_SHIFT     1       /* FAC2MP Power Good */
> > +#define ALTR_A10SR_PG2_FBC2MP_SHIFT     0       /* FBC2MP Power Good */
> > +
> >  #define ALTR_A10SR_PWR_GOOD3_REG      0x0C    /* Power Good3 Read */
> > +/* Power Good #3 Register Bit Definitions */
> > +#define ALTR_A10SR_PG3_FAM2C_SHIFT      7       /* FAM2C Power Good */
> > +#define ALTR_A10SR_PG3_10V_FAIL_SHIFT   6       /* 10V Fail n */
> > +
> >  #define ALTR_A10SR_FMCAB_REG          0x0E    /* FMCA/B & PCIe Pwr Enable 
> > */
> >  #define ALTR_A10SR_HPS_RST_REG        0x10    /* HPS Reset */
> >  #define ALTR_A10SR_USB_QSPI_REG       0x12    /* USB, BQSPI, FILE Reset */
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
