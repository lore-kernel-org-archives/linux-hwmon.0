Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A83C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 23:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C090206D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 23:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgGNXCt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 19:02:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:2727 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbgGNXCs (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 19:02:48 -0400
IronPort-SDR: kv5b9PfXYwMW/blTKW9rVOmdCdvnzfiDFdgHhxzqU/IkTI0ahMAC9QdxHbbVnt9ChAiSzXkSoc
 maRN7r6WWaxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="128604420"
X-IronPort-AV: E=Sophos;i="5.75,353,1589266800"; 
   d="gz'50?scan'50,208,50";a="128604420"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 16:02:15 -0700
IronPort-SDR: b6JF7lWesr+PEZ8A7kgh3gauYIAx//2kkt6t8KQJLfHrUi4VAxnhzfjW593aI0ypVDhUuo4cr9
 ZHuerUz5Mibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,353,1589266800"; 
   d="gz'50?scan'50,208,50";a="485522888"
Received: from lkp-server02.sh.intel.com (HELO 393d9bdf0d5c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jul 2020 16:02:12 -0700
Received: from kbuild by 393d9bdf0d5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvTwB-0000K4-HM; Tue, 14 Jul 2020 23:02:11 +0000
Date:   Wed, 15 Jul 2020 07:01:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     jaap aarts <jaap.aarts1@gmail.com>, Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     kbuild-all@lists.01.org, jaap aarts <jaap.aarts1@gmail.com>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <202007150616.CCfqXAdk%lkp@intel.com>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20200714100337.48719-1-jaap.aarts1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi jaap,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hwmon/hwmon-next]
[also build test ERROR on v5.8-rc5 next-20200714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/jaap-aarts/hwmon-add-fan-pwm-driver-for-corsair-h100i-platinum/20200714-180650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: m68k-allmodconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:13,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:10,
                    from include/linux/interrupt.h:11,
                    from include/linux/usb.h:16,
                    from drivers/hwmon/asetek_gen6.c:23:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:7: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |  ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |       ^~~
   arch/m68k/include/asm/raw_io.h:430:3: note: in expansion of macro 'rom_out_8'
     430 |   rom_out_8(port, *buf++);
         |   ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |        ^~~
   arch/m68k/include/asm/raw_io.h:448:3: note: in expansion of macro 'rom_out_be16'
     448 |   rom_out_be16(port, *buf++);
         |   ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |        ^~~
   arch/m68k/include/asm/raw_io.h:466:3: note: in expansion of macro 'rom_out_le16'
     466 |   rom_out_le16(port, *buf++);
         |   ^~~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:174:5: warning: no previous prototype for 'set_fan_rpm_curve' [-Wmissing-prototypes]
     174 | int set_fan_rpm_curve(struct driver *cdev, struct hwmon_fan_data *fan_data,
         |     ^~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/usb/ch9.h:36,
                    from include/linux/usb.h:6,
                    from drivers/hwmon/asetek_gen6.c:23:
   drivers/hwmon/asetek_gen6.c: In function 'set_fan_rpm_curve':
>> drivers/hwmon/asetek_gen6.c:212:12: error: passing argument 1 of '_dev_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
     212 |   dev_info("[*] Failled setting fan curve %d,%d,%d/%d\n",
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |            |
         |            char *
   include/linux/dev_printk.h:110:12: note: in definition of macro 'dev_info'
     110 |  _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |            ^~~
   include/linux/dev_printk.h:48:37: note: expected 'const struct device *' but argument is of type 'char *'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                ~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/hwmon/asetek_gen6.c:213:13: warning: passing argument 2 of '_dev_info' makes pointer from integer without a cast [-Wint-conversion]
     213 |     recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
         |     ~~~~~~~~^~~
         |             |
         |             char
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/hwmon/asetek_gen6.c:212:3: note: in expansion of macro 'dev_info'
     212 |   dev_info("[*] Failled setting fan curve %d,%d,%d/%d\n",
         |   ^~~~~~~~
   include/linux/dev_printk.h:48:54: note: expected 'const char *' but argument is of type 'char'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                                          ~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:217:5: warning: no previous prototype for 'set_fan_target_rpm' [-Wmissing-prototypes]
     217 | int set_fan_target_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/usb/ch9.h:36,
                    from include/linux/usb.h:6,
                    from drivers/hwmon/asetek_gen6.c:23:
   drivers/hwmon/asetek_gen6.c: In function 'set_fan_target_rpm':
   drivers/hwmon/asetek_gen6.c:246:12: error: passing argument 1 of '_dev_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
     246 |   dev_info("[*] Failled setting fan rpm %d,%d,%d/%d\n",
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |            |
         |            char *
   include/linux/dev_printk.h:110:12: note: in definition of macro 'dev_info'
     110 |  _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |            ^~~
   include/linux/dev_printk.h:48:37: note: expected 'const struct device *' but argument is of type 'char *'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c:247:13: warning: passing argument 2 of '_dev_info' makes pointer from integer without a cast [-Wint-conversion]
     247 |     recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
         |     ~~~~~~~~^~~
         |             |
         |             char
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/hwmon/asetek_gen6.c:246:3: note: in expansion of macro 'dev_info'
     246 |   dev_info("[*] Failled setting fan rpm %d,%d,%d/%d\n",
         |   ^~~~~~~~
   include/linux/dev_printk.h:48:54: note: expected 'const char *' but argument is of type 'char'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                                          ~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:251:6: warning: no previous prototype for 'get_fan_target_rpm' [-Wmissing-prototypes]
     251 | void get_fan_target_rpm(struct hwmon_fan_data *fan_data, long *val)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c:256:5: warning: no previous prototype for 'get_fan_current_rpm' [-Wmissing-prototypes]
     256 | int get_fan_current_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/usb/ch9.h:36,
                    from include/linux/usb.h:6,
                    from drivers/hwmon/asetek_gen6.c:23:
   drivers/hwmon/asetek_gen6.c: In function 'get_fan_current_rpm':
   drivers/hwmon/asetek_gen6.c:280:12: error: passing argument 1 of '_dev_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
     280 |   dev_info("[*] Failled retrieving fan rmp %d,%d,%d/%d\n",
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |            |
         |            char *
   include/linux/dev_printk.h:110:12: note: in definition of macro 'dev_info'
     110 |  _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |            ^~~
   include/linux/dev_printk.h:48:37: note: expected 'const struct device *' but argument is of type 'char *'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c:281:13: warning: passing argument 2 of '_dev_info' makes pointer from integer without a cast [-Wint-conversion]
     281 |     recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
         |     ~~~~~~~~^~~
         |             |
         |             char
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/hwmon/asetek_gen6.c:280:3: note: in expansion of macro 'dev_info'
     280 |   dev_info("[*] Failled retrieving fan rmp %d,%d,%d/%d\n",
         |   ^~~~~~~~
   include/linux/dev_printk.h:48:54: note: expected 'const char *' but argument is of type 'char'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                                          ~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:287:5: warning: no previous prototype for 'set_fan_target_pwm' [-Wmissing-prototypes]
     287 | int set_fan_target_pwm(struct driver *cdev, struct hwmon_fan_data *fan_data,
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/usb/ch9.h:36,
                    from include/linux/usb.h:6,
                    from drivers/hwmon/asetek_gen6.c:23:
   drivers/hwmon/asetek_gen6.c: In function 'set_fan_target_pwm':
   drivers/hwmon/asetek_gen6.c:315:12: error: passing argument 1 of '_dev_info' from incompatible pointer type [-Werror=incompatible-pointer-types]
     315 |   dev_info("[*] Failled setting fan pwm %d,%d,%d/%d\n",
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |            |
         |            char *
   include/linux/dev_printk.h:110:12: note: in definition of macro 'dev_info'
     110 |  _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |            ^~~
   include/linux/dev_printk.h:48:37: note: expected 'const struct device *' but argument is of type 'char *'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c:316:13: warning: passing argument 2 of '_dev_info' makes pointer from integer without a cast [-Wint-conversion]
     316 |     recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
         |     ~~~~~~~~^~~
         |             |
         |             unsigned char
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/hwmon/asetek_gen6.c:315:3: note: in expansion of macro 'dev_info'
     315 |   dev_info("[*] Failled setting fan pwm %d,%d,%d/%d\n",
         |   ^~~~~~~~
   include/linux/dev_printk.h:48:54: note: expected 'const char *' but argument is of type 'unsigned char'
      48 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                                          ~~~~~~~~~~~~^~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:320:9: warning: no previous prototype for 'is_visible_func' [-Wmissing-prototypes]
     320 | umode_t is_visible_func(const void *d, enum hwmon_sensor_types type, u32 attr,
         |         ^~~~~~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c:475:5: warning: no previous prototype for 'read_func' [-Wmissing-prototypes]
     475 | int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
         |     ^~~~~~~~~
   drivers/hwmon/asetek_gen6.c:556:6: warning: no previous prototype for 'does_fan_exist' [-Wmissing-prototypes]
     556 | bool does_fan_exist(struct driver *cdev, int channel)
         |      ^~~~~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c: In function 'does_fan_exist':
   drivers/hwmon/asetek_gen6.c:569:16: warning: overflow in conversion from 'int' to 'char' changes value from '600' to '88' [-Woverflow]
     569 |  send_buf[3] = 600;
         |                ^~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:584:5: warning: no previous prototype for 'get_fan_count' [-Wmissing-prototypes]
     584 | int get_fan_count(struct driver *dev)
         |     ^~~~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c:593:6: warning: no previous prototype for 'hwmon_init' [-Wmissing-prototypes]
     593 | void hwmon_init(struct driver *dev)
         |      ^~~~~~~~~~
   drivers/hwmon/asetek_gen6.c: In function 'hwmon_init':
>> drivers/hwmon/asetek_gen6.c:650:30: error: macro "dev_info" requires 3 arguments, but only 1 given
     650 |  dev_info("[*] Setup hwmon\n");
         |                              ^
   In file included from include/linux/device.h:15,
                    from include/linux/usb/ch9.h:36,
                    from include/linux/usb.h:6,
                    from drivers/hwmon/asetek_gen6.c:23:
   include/linux/dev_printk.h:109: note: macro "dev_info" defined here
     109 | #define dev_info(dev, fmt, ...)      \
         | 
>> drivers/hwmon/asetek_gen6.c:650:2: error: 'dev_info' undeclared (first use in this function); did you mean '_dev_info'?
     650 |  dev_info("[*] Setup hwmon\n");
         |  ^~~~~~~~
         |  _dev_info
   drivers/hwmon/asetek_gen6.c:650:2: note: each undeclared identifier is reported only once for each function it appears in
   drivers/hwmon/asetek_gen6.c:596:17: warning: variable 'hwmon_dev' set but not used [-Wunused-but-set-variable]
     596 |  struct device *hwmon_dev;
         |                 ^~~~~~~~~
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:653:6: warning: no previous prototype for 'hwmon_deinit' [-Wmissing-prototypes]
     653 | void hwmon_deinit(struct driver *dev)
         |      ^~~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c: In function 'hwmon_deinit':
   drivers/hwmon/asetek_gen6.c:656:35: error: macro "dev_info" requires 3 arguments, but only 1 given
     656 |  dev_info("[*] HWMON DISCONNECT\n");
         |                                   ^
   In file included from include/linux/device.h:15,
                    from include/linux/usb/ch9.h:36,
                    from include/linux/usb.h:6,
                    from drivers/hwmon/asetek_gen6.c:23:
   include/linux/dev_printk.h:109: note: macro "dev_info" defined here
     109 | #define dev_info(dev, fmt, ...)      \
         | 
   drivers/hwmon/asetek_gen6.c:656:2: error: 'dev_info' undeclared (first use in this function); did you mean '_dev_info'?
     656 |  dev_info("[*] HWMON DISCONNECT\n");
         |  ^~~~~~~~
         |  _dev_info
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:670:5: warning: no previous prototype for 'init_device' [-Wmissing-prototypes]
     670 | int init_device(struct usb_device *udev)
         |     ^~~~~~~~~~~
   drivers/hwmon/asetek_gen6.c: In function 'init_device':
   drivers/hwmon/asetek_gen6.c:678:3: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     678 |   ;
         |   ^
   drivers/hwmon/asetek_gen6.c: At top level:
   drivers/hwmon/asetek_gen6.c:688:5: warning: no previous prototype for 'deinit_device' [-Wmissing-prototypes]
     688 | int deinit_device(struct usb_device *udev)
         |     ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/_dev_info +212 drivers/hwmon/asetek_gen6.c

  > 23	#include <linux/usb.h>
    24	#include <linux/slab.h>
    25	#include <linux/mutex.h>
    26	#include <linux/errno.h>
    27	#include <linux/hwmon.h>
    28	#include <linux/hwmon-sysfs.h>
    29	
    30	struct driver {
    31		struct usb_device *udev;
    32	
    33		char *bulk_out_buffer;
    34		char *bulk_in_buffer;
    35		size_t bulk_out_size;
    36		size_t bulk_in_size;
    37		char bulk_in_endpointAddr;
    38		char bulk_out_endpointAddr;
    39	
    40		struct usb_interface *interface; /* the interface for this device */
    41		struct mutex io_mutex; /* synchronize I/O with disconnect */
    42		struct semaphore
    43			limit_sem; /* limiting the number of writes in progress */
    44	
    45		struct kref kref;
    46	};
    47	
    48	struct curve_point {
    49		uint8_t temp;
    50		uint8_t pwm;
    51	};
    52	
    53	struct hwmon_fan_data {
    54		char fan_channel;
    55		long fan_target;
    56		unsigned char fan_pwm_target;
    57		long mode;
    58		struct curve_point curve[7];
    59	};
    60	
    61	struct hwmon_data {
    62		struct driver *dev;
    63		int channel_count;
    64		void **channel_data;
    65	};
    66	
    67	struct curve_point quiet_curve[] = {
    68		{
    69			.temp = 0x1F,
    70			.pwm = 0x15,
    71		},
    72		{
    73			.temp = 0x21,
    74			.pwm = 0x1E,
    75		},
    76		{
    77			.temp = 0x24,
    78			.pwm = 0x25,
    79		},
    80		{
    81			.temp = 0x27,
    82			.pwm = 0x2D,
    83		},
    84		{
    85			.temp = 0x29,
    86			.pwm = 0x38,
    87		},
    88		{
    89			.temp = 0x2C,
    90			.pwm = 0x4A,
    91		},
    92		{
    93			.temp = 0x2F,
    94			.pwm = 0x64,
    95		},
    96	};
    97	
    98	struct curve_point balanced_curve[] = {
    99		{
   100			.temp = 0x1C,
   101			.pwm = 0x15,
   102		},
   103		{
   104			.temp = 0x1E,
   105			.pwm = 0x1B,
   106		},
   107		{
   108			.temp = 0x20,
   109			.pwm = 0x23,
   110		},
   111		{
   112			.temp = 0x22,
   113			.pwm = 0x28,
   114		},
   115		{
   116			.temp = 0x24,
   117			.pwm = 0x32,
   118		},
   119		{
   120			.temp = 0x27,
   121			.pwm = 0x48,
   122		},
   123		{
   124			.temp = 0x29,
   125			.pwm = 0x64,
   126		},
   127	};
   128	
   129	struct curve_point extreme_curve[] = {
   130		{
   131			.temp = 0x19,
   132			.pwm = 0x28,
   133		},
   134		{
   135			.temp = 0x1B,
   136			.pwm = 0x2E,
   137		},
   138		{
   139			.temp = 0x1D,
   140			.pwm = 0x37,
   141		},
   142		{
   143			.temp = 0x1E,
   144			.pwm = 0x41,
   145		},
   146		{
   147			.temp = 0x1F,
   148			.pwm = 0x4C,
   149		},
   150		{
   151			.temp = 0x20,
   152			.pwm = 0x56,
   153		},
   154		{
   155			.temp = 0x21,
   156			.pwm = 0x64,
   157		},
   158	};
   159	
   160	#define default_curve quiet_curve
   161	
   162	static const char SUCCESS[2] = { 0x12, 0x34 };
   163	
   164	#define SUCCES_LENGTH 3
   165	
   166	static bool check_succes(char command, char ret[SUCCES_LENGTH])
   167	{
   168		char success[SUCCES_LENGTH] = { command };
   169	
   170		strncpy(&success[1], SUCCESS, SUCCES_LENGTH - 1);
   171		return strncmp(ret, success, SUCCES_LENGTH - 1) == 0;
   172	}
   173	
 > 174	int set_fan_rpm_curve(struct driver *cdev, struct hwmon_fan_data *fan_data,
   175			      struct curve_point point[7])
   176	{
   177		int retval;
   178		int wrote;
   179		int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
   180		int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
   181		char *send_buf = cdev->bulk_out_buffer;
   182		char *recv_buf = cdev->bulk_in_buffer;
   183	
   184		memcpy(fan_data->curve, point, sizeof(fan_data->curve));
   185	
   186		send_buf[0] = 0x40;
   187		send_buf[1] = fan_data->fan_channel;
   188		send_buf[2] = point[0].temp;
   189		send_buf[3] = point[1].temp;
   190		send_buf[4] = point[2].temp;
   191		send_buf[5] = point[3].temp;
   192		send_buf[6] = point[4].temp;
   193		send_buf[7] = point[5].temp;
   194		send_buf[8] = point[6].temp;
   195		send_buf[9] = point[0].pwm;
   196		send_buf[10] = point[1].pwm;
   197		send_buf[11] = point[2].pwm;
   198		send_buf[12] = point[3].pwm;
   199		send_buf[13] = point[4].pwm;
   200		send_buf[14] = point[5].pwm;
   201		send_buf[15] = point[6].pwm;
   202	
   203		retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 16, &wrote, 100);
   204		if (retval != 0)
   205			return retval;
   206	
   207		retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 4, &wrote, 100);
   208		if (retval != 0)
   209			return retval;
   210	
   211		if (!check_succes(send_buf[0], recv_buf))
 > 212			dev_info("[*] Failled setting fan curve %d,%d,%d/%d\n",
 > 213				 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
   214		return 0;
   215	}
   216	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--xHFwDpU9dbj6ez1V
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--xHFwDpU9dbj6ez1V--
