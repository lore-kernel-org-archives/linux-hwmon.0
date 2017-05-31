Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60663 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbdEaNds (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 May 2017 09:33:48 -0400
Subject: Re: hwmon: (aspeed-pwm-tacho) Enable both edge measurement.
To: Patrick Venture <venture@google.com>,
        Rick Altherr <raltherr@google.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com
References: <20170530202739.31508-1-venture@google.com>
 <20170530222556.GA10520@roeck-us.net>
 <CAO=notwamYHt-hkqicuaN08Tsm1_idm8_mn0vDVzr4v_NDoaHQ@mail.gmail.com>
 <CAO=notys7OMk3yfyffgqVLFP=aiQMM_kdLT-PbprsUvB2nU-pg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c73f6663-fec4-cb47-6337-085912cce84c@roeck-us.net>
Date: Wed, 31 May 2017 06:33:24 -0700
MIME-Version: 1.0
In-Reply-To: <CAO=notys7OMk3yfyffgqVLFP=aiQMM_kdLT-PbprsUvB2nU-pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/30/2017 06:16 PM, Patrick Venture wrote:
> I have a version of this driver that pulls the tune-able values from a device tree that I'd ultimately like to upstream. For that version to work properly it does rely on the both edge support, just in case a platform uses that setting.
> 
> Would it make sense to push that patch up now as there is an overall theme to my patches.
> 

Or provide an explanation like you are doing below.

> Patrick
> 
> On May 30, 2017 5:11 PM, "Patrick Venture" <venture@google.com <mailto:venture@google.com>> wrote:
> 
>     On Tue, May 30, 2017 at 01:27:39PM -0700, Patrick Venture wrote:
>      >> The aspeed-pwm-tacho controller supports measuring the fan tach by using
>      >> leading, falling, or both edges.  This change allows the driver to
>      >> support either of the three configurations and will appropriately modify
>      >> the returned tach data.
>      >
>      >> I tested this and found the number returned matched what I expected.

[ wonder if this adds value to the patch description. Maybe after '---' ? ]

>      >
>      >> Signed-off-by: Patrick Venture <venture@google.com <mailto:venture@google.com>>
>      >> ---
>      >>  drivers/hwmon/aspeed-pwm-tacho.c | 24 +++++++++++++++++++++---
>      >>  1 file changed, 21 insertions(+), 3 deletions(-)
>      >
>      >> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
>      >> index 48403a2115be..f288928b5e8a 100644
>      >> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>      >> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>      >> @@ -145,11 +145,20 @@
>      >
>      >>  #define PWM_MAX 255
>      >
>      >> +#define BOTH_EDGES 0x02 /* 10b */
>      >> +
>      >>  #define M_PWM_DIV_H 0x00
>      >>  #define M_PWM_DIV_L 0x05
>      >>  #define M_PWM_PERIOD 0x5F
>      >>  #define M_TACH_CLK_DIV 0x00
>      >> -#define M_TACH_MODE 0x00
>      >> +/*
>      >> + * 5:4 Type N fan tach mode selection bit:
>      >> + * 00: falling
>      >> + * 01: rising
>      >> + * 10: both
>      >> + * 11: reserved.
>      >> + */
>      >> +#define M_TACH_MODE 0x10
> 
>      > That seems wrong. The above is a bit mask, this is an already shifted value.
> 
>     Good catch.  That's a reading bits, writing nibbles bug.  I did my
>     testing in a branch that uses the device tree to control these knobs
>     to get better tuning.  I have a series of tweaks to improve the
>     responsiveness of this code.  Originally the driver author was told to
>     modify the driver to remove the knobs by upstream.  For my platform,
>     I've found the knobs are critical, and there are other changes
>     associated with them.  I'm making an effort to get these changes in
>     ahead of trying to re-enable the device-tree patch.
> 
>     Different systems using this aspeed driver may actually need different
>     values, but for a few systems, I have found higher performing values.
> 
>     The data sheet is light on details, so some information is gleaned
>     from the aspeed reference driver.
> 
>      >>  #define M_TACH_UNIT 0x1000
> 
>      > ... and this one seems wrong too, since it is passed to aspeed_set_tacho_type_values() which shifts it left by 16 bit.
> 
>     That seems wonky however, I believe the compiler is promoting the
>     values to 32-bits before shifting them.  That's something I've
>     definitely seen before.  However, I can manually cast them if you're
>     weary of it.
> 

It does. Not having the datasheet, I thought this was another case of shift vs. value.

>     #define ASPEED_PTCR_TYPEM_CTRL          0x10
>     #define ASPEED_PTCR_TYPEM_CTRL1         0x14
>     #define TYPE_CTRL_FAN_PERIOD            16
>     #define TYPE_CTRL_FAN_MODE              4
>     #define TYPE_CTRL_FAN_DIVISION          1
>     #define M_TACH_CLK_DIV 0x00
> 
>     Offset: 10h PTCR10: Type M Control 0 Register Init = X
>     31:16 RW Type M fan tach period bit [15:0] (in unit of type M PWM clock)
>     5 :4 RW Type M fan tach mode selection bit [1:0]
>        00: falling edge
>        01: rising edge
>        10: both edges
>        11: reserved
>     3 :1 RW Type M fan tach clock division bit [1:0]
>        000: divide 4
>        001: divide 16
>        010: divide 64
>        011: divide 256 ...
>        111: divide 65536
>     0 RW Enable fan tach of type M 0: disable 1: enable
> 
>     Offset: 14h PTCR14: Type M Control 1 Register Init = X
>     Bit R/W Description
>     31:16 RW Type M fan tach falling point bit [15:0] of period
>     15:0 RW Type M fan tach rising point bit [15:0] of period
> 
>     0x1000 << 16 | 0x02 << 4 | M_TACH_CLK_DIV << 1
> 
>              u32 reg_value = ((mode << TYPE_CTRL_FAN_MODE) |
>                               (unit << TYPE_CTRL_FAN_PERIOD) |
>                               (division << TYPE_CTRL_FAN_DIVISION));
> 
>              regmap_update_bits(regmap, type_params[type].ctrl_reg,
>     TYPE_CTRL_FAN_MASK, reg_value);
>              regmap_update_bits(regmap, type_params[type].ctrl_reg1,
>     TYPE_CTRL_FAN1_MASK, unit << 16);
> 
>     For type M Control 0 Register they're setting the fan tach period to
>     0x1000.  Presumably the compiler is promoting the value to 32-bits.
> 
>     For Type M Control 1 Register they're setting the fan tach falling
>     point to 0x1000 and the rising point to 0.  Presumably the compiler is
>     promoting unit to 32 bits.  I'm completely comfortable casting it to
>     address this.
> 
>      >>  #define INIT_FAN_CTRL 0xFF
>      >
>      >> @@ -162,6 +171,7 @@ struct aspeed_pwm_tacho_data {
>      >>       u8 type_pwm_clock_division_h[3];
>      >>       u8 type_pwm_clock_division_l[3];
>      >>       u8 type_fan_tach_clock_division[3];
>      >> +     u8 type_fan_tach_mode[3];
>      >>       u16 type_fan_tach_unit[3];
>      >>       u8 pwm_port_type[8];
>      >>       u8 pwm_port_fan_ctrl[8];
>      >> @@ -498,7 +508,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>      >>                                     u8 fan_tach_ch)
>      >>  {
>      >>       u32 raw_data, tach_div, clk_source, sec, val;
>      >> -     u8 fan_tach_ch_source, type;
>      >> +     u8 fan_tach_ch_source, type, mode, both;
>      >
>      >>       regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
>      >>       regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0x1 << fan_tach_ch);
>      >> @@ -512,7 +522,14 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>      >>       regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
>      >>       raw_data = val & RESULT_VALUE_MASK;
>      >>       tach_div = priv->type_fan_tach_clock_division[type];
>      >> -     tach_div = 0x4 << (tach_div * 2);
>      >> +     /*
>      >> +      * We need the mode to determine if the raw_data is double (from
>      >> +      * counting both edges).
>      >> +      */
>      >> +     mode = priv->type_fan_tach_mode[type];
>      >> +     both = (mode & BOTH_EDGES) ? 1 : 0;
> 
>      > BOTH_EDGES is 0x02. Mode is 0x10. ???
> 
>     Bit -> nibble bug.
> 
>      >> +
>      >> +     tach_div = (0x4 << both) << (tach_div * 2);
>      >>       clk_source = priv->clk_freq;
>      >
>      >>       if (raw_data == 0)
>      >> @@ -696,6 +713,7 @@ static void aspeed_create_type(struct aspeed_pwm_tacho_data *priv)
>      >>       aspeed_set_tacho_type_enable(priv->regmap, TYPEM, true);
>      >>       priv->type_fan_tach_clock_division[TYPEM] = M_TACH_CLK_DIV;
>      >>       priv->type_fan_tach_unit[TYPEM] = M_TACH_UNIT;
>      >> +     priv->type_fan_tach_mode[TYPEM] = M_TACH_MODE;
> 
>      > type_fan_tach_mode[] is always M_TACH_MODE or 0x10, and BOTH_EDGES (0x02) is never set.
> 
>      > What am I missing here ? Not sure what you are trying to accomplish.
>      > Even if the bit mask is corrected, what is the benefit of changing the mode ?
> 
>     The benefit of changing the mode is that I can tune down (I was
>     planning a series of these patches but I'm still new to upstreaming to
>     linux and didn't want to get mixed up, too late) the time it takes for
>     the controller to provide the fan speeds.
> 
>     At present this driver takes 1s per fan.  The controller itself
>     appears to cache the speeds every 0.08s seconds, so with this and a
>     few other tweaks I can get the individual read speed down to 0.017
>     seconds each and get a fresh value more than 10x per second.  Which is
>     something I need for a PID based fan controller.
> 
>     One of the ways I improved this was reducing the fan tach period.  I'm
>     able to get reliable numbers with a lower period, but I'd rather
>     people be able to tune that.  However, I can update the driver to have
>     better defaults.
> 
Some of this might be worthwhile as comment in the driver. Using both-edge mode
to improve responsiveness is a worthy goal, but so is documenting it.

Thanks,
Guenter

>      > Guenter
> 
>      >>       aspeed_set_tacho_type_values(priv->regmap, TYPEM, M_TACH_MODE,
>      >>                                    M_TACH_UNIT, M_TACH_CLK_DIV);
>      >>  }
> 

