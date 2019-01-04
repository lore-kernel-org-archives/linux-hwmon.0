From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 08:24:59 -0800
Subject: Re: [PATCH V4] net: phy: tja11xx: Add TJA11xx PHY driver
In-Reply-To: <20190104021547.15527-1-marex@denx.de>
Message-ID: <E29570D9-3298-443A-8809-7E5BC4147FCD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>




On January 3, 2019 6:15:47 PM PST, Marek Vasut <ma...@denx.de> wrote:
>Add driver for the NXP TJA1100 and TJA1101 PHYs. These PHYs are special
>BroadRReach 100BaseT1 PHYs used in automotive.
>
>Signed-off-by: Marek Vasut <ma...@denx.de>
>Cc: Andrew Lunn <and...@lunn.ch>
>Cc: Florian Fainelli <f.faine...@gmail.com>
>Cc: Guenter Roeck <li...@roeck-us.net>
>Cc: Heiner Kallweit <hkallwe...@gmail.com>
>Cc: Jean Delvare <jdelv...@suse.com>
>Cc: linux-hwmon@vger.kernel.org
>---
>V2: - Use phy_modify(), phy_{set,clear}_bits()
>    - Drop enable argument of tja11xx_enable_link_control()
>    - Use PHY_BASIC_T1_FEATURES and dont modify supported/advertised
>      features in config_init callback
>    - Use genphy_soft_reset() instead of opencoding the reset sequence.
>    - Drop the aneg parts, since the PHY datasheet claims it does not
>      support aneg
>V3: - Replace clr with mask
>    - Add hwmon support
>    - Check commstat in tja11xx_read_status() only if link is up
>    - Use PHY_ID_MATCH_MODEL()
>V4: - Use correct bit in tja11xx_hwmon_read() hwmon_temp_crit_alarm
>    - Use ENOMEM if devm_kstrdup() fails
>    - Check $type in tja11xx_hwmon_read() in addition to $attr
>---

[Snip]

>+      ret = tja11xx_enable_reg_write(phydev);
>+      if (ret)
>+              return ret;
>+
>+      phydev->irq = PHY_POLL;

The PHY driver should not be imposing that, leave it up to the platform 
configuration to set that.

>+      phydev->autoneg = AUTONEG_DISABLE;
>+      phydev->speed = SPEED_100;
>+      phydev->duplex = DUPLEX_FULL;
>+      phydev->pause = 0;
>+      phydev->asym_pause = 0;

Are any of those necessary if you set basic T1 features?

Everything else looks good to me. Thanks!
-- 
Florian
