Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13233EB64D7
	for <linux-hwmon@archiver.kernel.org>; Sun, 18 Jun 2023 03:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjFRDeG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Jun 2023 23:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjFRDeF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Jun 2023 23:34:05 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9D2A9
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jun 2023 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687059243; x=1718595243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjR5PcM/MRpCe5eYO2hA93LRfXOHw+ax3Pq+gLVkbCI=;
  b=JzrDHqm3f6vQPuoJ+vuaEa/9Vv494P7t0V9b4EpS5BMd4OMNGjes+m8M
   nzt1fNLWtIrzlapXFH29PXGYG7Ae3KbM6Uz4OPbW8+uv/uVC7H8KGGjJr
   VLLmsCp1k9El2O7hLh+pTafogsy8uUbTOGatg0PcxBAXh9BQ5D4BdadIT
   2bcrK4RghRkx+WuWwaF/VbsBud1Nn9QKPURXdGcwFE65YAqwtGmu0SKiN
   +1X0G7MlmgH/SGb/e94MnwuTnV6AV1r4kU37HA5vJFRwcw2Fijm70k8oM
   PyfN+P/6ka8nzRcUDAHeR6FRdgvIUR5h2UrAMbybwUYpIHvH/3a7ZhbEA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339059456"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339059456"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 20:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="713293455"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="713293455"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jun 2023 20:34:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qAjAu-0003Lw-2o;
        Sun, 18 Jun 2023 03:34:00 +0000
Date:   Sun, 18 Jun 2023 11:33:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next 44/45]
 drivers/hwmon/nct6775-platform.c:589 nct6775_check_fan_inputs() warn:
 inconsistent indenting
Message-ID: <202306181111.sHn2grEL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   e88ef801065feff97e458db43549dd23f7c1b25f
commit: 3272a8f6f2d90af6c7a6d8d0abd57ec3bf03c072 [44/45] hwmon: (nct6755) Add support for NCT6799D
config: x86_64-randconfig-m001-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181111.sHn2grEL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181111.sHn2grEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181111.sHn2grEL-lkp@intel.com/

smatch warnings:
drivers/hwmon/nct6775-platform.c:589 nct6775_check_fan_inputs() warn: inconsistent indenting

vim +589 drivers/hwmon/nct6775-platform.c

   483	
   484	static void
   485	nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio_data)
   486	{
   487		bool fan3pin = false, fan4pin = false, fan4min = false;
   488		bool fan5pin = false, fan6pin = false, fan7pin = false;
   489		bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
   490		bool pwm6pin = false, pwm7pin = false;
   491	
   492		/* Store SIO_REG_ENABLE for use during resume */
   493		sio_data->sio_select(sio_data, NCT6775_LD_HWM);
   494		data->sio_reg_enable = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
   495	
   496		/* fan4 and fan5 share some pins with the GPIO and serial flash */
   497		if (data->kind == nct6775) {
   498			int cr2c = sio_data->sio_inb(sio_data, 0x2c);
   499	
   500			fan3pin = cr2c & BIT(6);
   501			pwm3pin = cr2c & BIT(7);
   502	
   503			/* On NCT6775, fan4 shares pins with the fdc interface */
   504			fan4pin = !(sio_data->sio_inb(sio_data, 0x2A) & 0x80);
   505		} else if (data->kind == nct6776) {
   506			bool gpok = sio_data->sio_inb(sio_data, 0x27) & 0x80;
   507			const char *board_vendor, *board_name;
   508	
   509			board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
   510			board_name = dmi_get_system_info(DMI_BOARD_NAME);
   511	
   512			if (board_name && board_vendor &&
   513			    !strcmp(board_vendor, "ASRock")) {
   514				/*
   515				 * Auxiliary fan monitoring is not enabled on ASRock
   516				 * Z77 Pro4-M if booted in UEFI Ultra-FastBoot mode.
   517				 * Observed with BIOS version 2.00.
   518				 */
   519				if (!strcmp(board_name, "Z77 Pro4-M")) {
   520					if ((data->sio_reg_enable & 0xe0) != 0xe0) {
   521						data->sio_reg_enable |= 0xe0;
   522						sio_data->sio_outb(sio_data, SIO_REG_ENABLE,
   523							     data->sio_reg_enable);
   524					}
   525				}
   526			}
   527	
   528			if (data->sio_reg_enable & 0x80)
   529				fan3pin = gpok;
   530			else
   531				fan3pin = !(sio_data->sio_inb(sio_data, 0x24) & 0x40);
   532	
   533			if (data->sio_reg_enable & 0x40)
   534				fan4pin = gpok;
   535			else
   536				fan4pin = sio_data->sio_inb(sio_data, 0x1C) & 0x01;
   537	
   538			if (data->sio_reg_enable & 0x20)
   539				fan5pin = gpok;
   540			else
   541				fan5pin = sio_data->sio_inb(sio_data, 0x1C) & 0x02;
   542	
   543			fan4min = fan4pin;
   544			pwm3pin = fan3pin;
   545		} else if (data->kind == nct6106) {
   546			int cr24 = sio_data->sio_inb(sio_data, 0x24);
   547	
   548			fan3pin = !(cr24 & 0x80);
   549			pwm3pin = cr24 & 0x08;
   550		} else if (data->kind == nct6116) {
   551			int cr1a = sio_data->sio_inb(sio_data, 0x1a);
   552			int cr1b = sio_data->sio_inb(sio_data, 0x1b);
   553			int cr24 = sio_data->sio_inb(sio_data, 0x24);
   554			int cr2a = sio_data->sio_inb(sio_data, 0x2a);
   555			int cr2b = sio_data->sio_inb(sio_data, 0x2b);
   556			int cr2f = sio_data->sio_inb(sio_data, 0x2f);
   557	
   558			fan3pin = !(cr2b & 0x10);
   559			fan4pin = (cr2b & 0x80) ||			// pin 1(2)
   560				(!(cr2f & 0x10) && (cr1a & 0x04));	// pin 65(66)
   561			fan5pin = (cr2b & 0x80) ||			// pin 126(127)
   562				(!(cr1b & 0x03) && (cr2a & 0x02));	// pin 94(96)
   563	
   564			pwm3pin = fan3pin && (cr24 & 0x08);
   565			pwm4pin = fan4pin;
   566			pwm5pin = fan5pin;
   567		} else {
   568			/*
   569			 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
   570			 * NCT6797D, NCT6798D, NCT6799D
   571			 */
   572			int cr1a = sio_data->sio_inb(sio_data, 0x1a);
   573			int cr1b = sio_data->sio_inb(sio_data, 0x1b);
   574			int cr1c = sio_data->sio_inb(sio_data, 0x1c);
   575			int cr1d = sio_data->sio_inb(sio_data, 0x1d);
   576			int cr2a = sio_data->sio_inb(sio_data, 0x2a);
   577			int cr2b = sio_data->sio_inb(sio_data, 0x2b);
   578			int cr2d = sio_data->sio_inb(sio_data, 0x2d);
   579			int cr2f = sio_data->sio_inb(sio_data, 0x2f);
   580			bool vsb_ctl_en = cr2f & BIT(0);
   581			bool dsw_en = cr2f & BIT(3);
   582			bool ddr4_en = cr2f & BIT(4);
   583			bool as_seq1_en = cr2f & BIT(7);
   584			int cre0;
   585			int cre6;
   586			int creb;
   587			int cred;
   588	
 > 589				cre6 = sio_data->sio_inb(sio_data, 0xe0);
   590	
   591			sio_data->sio_select(sio_data, NCT6775_LD_12);
   592			cre0 = sio_data->sio_inb(sio_data, 0xe0);
   593			creb = sio_data->sio_inb(sio_data, 0xeb);
   594			cred = sio_data->sio_inb(sio_data, 0xed);
   595	
   596			fan3pin = !(cr1c & BIT(5));
   597			fan4pin = !(cr1c & BIT(6));
   598			fan5pin = !(cr1c & BIT(7));
   599	
   600			pwm3pin = !(cr1c & BIT(0));
   601			pwm4pin = !(cr1c & BIT(1));
   602			pwm5pin = !(cr1c & BIT(2));
   603	
   604			switch (data->kind) {
   605			case nct6791:
   606				fan6pin = cr2d & BIT(1);
   607				pwm6pin = cr2d & BIT(0);
   608				break;
   609			case nct6792:
   610				fan6pin = !dsw_en && (cr2d & BIT(1));
   611				pwm6pin = !dsw_en && (cr2d & BIT(0));
   612				break;
   613			case nct6793:
   614				fan5pin |= cr1b & BIT(5);
   615				fan5pin |= creb & BIT(5);
   616	
   617				fan6pin = !dsw_en && (cr2d & BIT(1));
   618				fan6pin |= creb & BIT(3);
   619	
   620				pwm5pin |= cr2d & BIT(7);
   621				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
   622	
   623				pwm6pin = !dsw_en && (cr2d & BIT(0));
   624				pwm6pin |= creb & BIT(2);
   625				break;
   626			case nct6795:
   627				fan5pin |= cr1b & BIT(5);
   628				fan5pin |= creb & BIT(5);
   629	
   630				fan6pin = (cr2a & BIT(4)) &&
   631						(!dsw_en || (cred & BIT(4)));
   632				fan6pin |= creb & BIT(3);
   633	
   634				pwm5pin |= cr2d & BIT(7);
   635				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
   636	
   637				pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
   638				pwm6pin |= creb & BIT(2);
   639				break;
   640			case nct6796:
   641				fan5pin |= cr1b & BIT(5);
   642				fan5pin |= (cre0 & BIT(3)) && !(cr1b & BIT(0));
   643				fan5pin |= creb & BIT(5);
   644	
   645				fan6pin = (cr2a & BIT(4)) &&
   646						(!dsw_en || (cred & BIT(4)));
   647				fan6pin |= creb & BIT(3);
   648	
   649				fan7pin = !(cr2b & BIT(2));
   650	
   651				pwm5pin |= cr2d & BIT(7);
   652				pwm5pin |= (cre0 & BIT(4)) && !(cr1b & BIT(0));
   653				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
   654	
   655				pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
   656				pwm6pin |= creb & BIT(2);
   657	
   658				pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
   659				break;
   660			case nct6797:
   661				fan5pin |= !ddr4_en && (cr1b & BIT(5));
   662				fan5pin |= creb & BIT(5);
   663	
   664				fan6pin = cr2a & BIT(4);
   665				fan6pin |= creb & BIT(3);
   666	
   667				fan7pin = cr1a & BIT(1);
   668	
   669				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
   670				pwm5pin |= !ddr4_en && (cr2d & BIT(7));
   671	
   672				pwm6pin = creb & BIT(2);
   673				pwm6pin |= cred & BIT(2);
   674	
   675				pwm7pin = cr1d & BIT(4);
   676				break;
   677			case nct6798:
   678				fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
   679				fan6pin |= cr2a & BIT(4);
   680				fan6pin |= creb & BIT(5);
   681	
   682				fan7pin = cr1b & BIT(5);
   683				fan7pin |= !(cr2b & BIT(2));
   684				fan7pin |= creb & BIT(3);
   685	
   686				pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
   687				pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
   688				pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
   689	
   690				pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
   691				pwm7pin |= cr2d & BIT(7);
   692				pwm7pin |= creb & BIT(2);
   693				break;
   694			case nct6799:
   695				fan4pin = cr1c & BIT(6);
   696				fan5pin = cr1c & BIT(7);
   697	
   698				fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
   699				fan6pin |= cre6 & BIT(5);
   700				fan6pin |= creb & BIT(5);
   701				fan6pin |= !as_seq1_en && (cr2a & BIT(4));
   702	
   703				fan7pin = cr1b & BIT(5);
   704				fan7pin |= !vsb_ctl_en && !(cr2b & BIT(2));
   705				fan7pin |= creb & BIT(3);
   706	
   707				pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
   708				pwm6pin |= !as_seq1_en && !(cred & BIT(2)) && (cr2a & BIT(3));
   709				pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
   710				pwm6pin |= cre6 & BIT(3);
   711	
   712				pwm7pin = !vsb_ctl_en && !(cr1d & (BIT(2) | BIT(3)));
   713				pwm7pin |= creb & BIT(2);
   714				pwm7pin |= cr2d & BIT(7);
   715	
   716				break;
   717			default:	/* NCT6779D */
   718				break;
   719			}
   720	
   721			fan4min = fan4pin;
   722		}
   723	
   724		/* fan 1 and 2 (0x03) are always present */
   725		data->has_fan = 0x03 | (fan3pin << 2) | (fan4pin << 3) |
   726			(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
   727		data->has_fan_min = 0x03 | (fan3pin << 2) | (fan4min << 3) |
   728			(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
   729		data->has_pwm = 0x03 | (pwm3pin << 2) | (pwm4pin << 3) |
   730			(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
