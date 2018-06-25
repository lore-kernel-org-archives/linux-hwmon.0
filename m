Return-Path: <dan.carpenter@oracle.com>
Return-path: <dan.carpenter@oracle.com>
Date: Mon, 25 Jun 2018 15:43:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@01.org, Tomer Maimon <tmaimon77@gmail.com>
Cc: kbuild-all@01.org, robh+dt@kernel.org, mark.rutland@arm.com,
        jdelvare@suse.com, linux@roeck-us.net, avifishman70@gmail.com,
        yuenn@google.com, brendanhiggins@google.com, venture@google.com,
        joel@jms.id.au, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
Message-ID: <20180625124332.e7oyxezasn374w4b@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180624124155.82412-3-tmaimon77@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Tomer,

I love your patch! Perhaps something to improve:

[auto build test WARNING on hwmon/hwmon-next]
[also build test WARNING on v4.18-rc2 next-20180622]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Tomer-Maimon/dt-binding-hwmon-Add-NPCM7xx-PWM-and-Fan-controller-documentation/20180624-205017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next

New smatch warnings:
drivers/hwmon/npcm750-pwm-fan.c:261 npcm7xx_pwm_config_set() warn: inconsistent returns 'mutex:&data->pwm_lock[module]'.
  Locked on:   line 245
  Unlocked on: line 261

Old smatch warnings:
drivers/hwmon/npcm750-pwm-fan.c:836 npcm7xx_pwm_cz_set_cur_state() warn: potential spectre issue 'cdev->cooling_levels'

# https://github.com/0day-ci/linux/commit/5ef6a0a11de5f3f0711993a20b13820cc0884c7e
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5ef6a0a11de5f3f0711993a20b13820cc0884c7e
vim +261 drivers/hwmon/npcm750-pwm-fan.c

5ef6a0a1 Tomer Maimon 2018-06-24  210  
5ef6a0a1 Tomer Maimon 2018-06-24  211  static int npcm7xx_pwm_config_set(struct npcm7xx_pwm_fan_data *data,
5ef6a0a1 Tomer Maimon 2018-06-24  212  				  int channel, u16 val)
5ef6a0a1 Tomer Maimon 2018-06-24  213  {
5ef6a0a1 Tomer Maimon 2018-06-24  214  	u32 pwm_ch = (channel % NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE);
5ef6a0a1 Tomer Maimon 2018-06-24  215  	u32 module = (channel / NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE);
5ef6a0a1 Tomer Maimon 2018-06-24  216  	u32 tmp_buf, ctrl_en_bit, env_bit;
5ef6a0a1 Tomer Maimon 2018-06-24  217  
5ef6a0a1 Tomer Maimon 2018-06-24  218  	/*
5ef6a0a1 Tomer Maimon 2018-06-24  219  	 * Config PWM Comparator register for setting duty cycle
5ef6a0a1 Tomer Maimon 2018-06-24  220  	 */
5ef6a0a1 Tomer Maimon 2018-06-24  221  	mutex_lock(&data->pwm_lock[module]);
5ef6a0a1 Tomer Maimon 2018-06-24  222  
5ef6a0a1 Tomer Maimon 2018-06-24  223  	/* write new CMR value  */
5ef6a0a1 Tomer Maimon 2018-06-24  224  	iowrite32(val, NPCM7XX_PWM_REG_CMRx(data->pwm_base, module, pwm_ch));
5ef6a0a1 Tomer Maimon 2018-06-24  225  	tmp_buf = ioread32(NPCM7XX_PWM_REG_CR(data->pwm_base, module));
5ef6a0a1 Tomer Maimon 2018-06-24  226  
5ef6a0a1 Tomer Maimon 2018-06-24  227  	switch (pwm_ch) {
5ef6a0a1 Tomer Maimon 2018-06-24  228  	case 0:
5ef6a0a1 Tomer Maimon 2018-06-24  229  		ctrl_en_bit = NPCM7XX_PWM_CTRL_CH0_EN_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  230  		env_bit = NPCM7XX_PWM_CTRL_CH0_INV_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  231  		break;
5ef6a0a1 Tomer Maimon 2018-06-24  232  	case 1:
5ef6a0a1 Tomer Maimon 2018-06-24  233  		ctrl_en_bit = NPCM7XX_PWM_CTRL_CH1_EN_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  234  		env_bit = NPCM7XX_PWM_CTRL_CH1_INV_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  235  		break;
5ef6a0a1 Tomer Maimon 2018-06-24  236  	case 2:
5ef6a0a1 Tomer Maimon 2018-06-24  237  		ctrl_en_bit = NPCM7XX_PWM_CTRL_CH2_EN_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  238  		env_bit = NPCM7XX_PWM_CTRL_CH2_INV_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  239  		break;
5ef6a0a1 Tomer Maimon 2018-06-24  240  	case 3:
5ef6a0a1 Tomer Maimon 2018-06-24  241  		ctrl_en_bit = NPCM7XX_PWM_CTRL_CH3_EN_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  242  		env_bit = NPCM7XX_PWM_CTRL_CH3_INV_BIT;
5ef6a0a1 Tomer Maimon 2018-06-24  243  		break;
5ef6a0a1 Tomer Maimon 2018-06-24  244  	default:
5ef6a0a1 Tomer Maimon 2018-06-24  245  		return -ENODEV;
                                                ^^^^^^^^^^^^^^
5ef6a0a1 Tomer Maimon 2018-06-24  246  	}
5ef6a0a1 Tomer Maimon 2018-06-24  247  
5ef6a0a1 Tomer Maimon 2018-06-24  248  	if (val == 0) {
5ef6a0a1 Tomer Maimon 2018-06-24  249  		/* Disable PWM */
5ef6a0a1 Tomer Maimon 2018-06-24  250  		tmp_buf &= ~ctrl_en_bit;
5ef6a0a1 Tomer Maimon 2018-06-24  251  		tmp_buf |= env_bit;
5ef6a0a1 Tomer Maimon 2018-06-24  252  	} else {
5ef6a0a1 Tomer Maimon 2018-06-24  253  		/* Enable PWM */
5ef6a0a1 Tomer Maimon 2018-06-24  254  		tmp_buf |= ctrl_en_bit;
5ef6a0a1 Tomer Maimon 2018-06-24  255  		tmp_buf &= ~env_bit;
5ef6a0a1 Tomer Maimon 2018-06-24  256  	}
5ef6a0a1 Tomer Maimon 2018-06-24  257  
5ef6a0a1 Tomer Maimon 2018-06-24  258  	iowrite32(tmp_buf, NPCM7XX_PWM_REG_CR(data->pwm_base, module));
5ef6a0a1 Tomer Maimon 2018-06-24  259  	mutex_unlock(&data->pwm_lock[module]);
5ef6a0a1 Tomer Maimon 2018-06-24  260  
5ef6a0a1 Tomer Maimon 2018-06-24 @261  	return 0;
5ef6a0a1 Tomer Maimon 2018-06-24  262  }
5ef6a0a1 Tomer Maimon 2018-06-24  263  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
