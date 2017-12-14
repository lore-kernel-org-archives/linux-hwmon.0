Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:39424 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754308AbdLNRrK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Dec 2017 12:47:10 -0500
Received: by mail-pf0-f194.google.com with SMTP id l24so4126504pfj.6
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Dec 2017 09:47:09 -0800 (PST)
Date: Thu, 14 Dec 2017 09:47:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Edward A. James" <eajames@us.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, kbuild-all@01.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [hwmon:hwmon-next 20/20] drivers/hwmon/pmbus/ibm-cffps.c:144:48:
 sparse: cast to restricted __be16
Message-ID: <20171214174706.GA8995@roeck-us.net>
References: <201712150100.CHwteRtv%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201712150100.CHwteRtv%fengguang.wu@intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 15, 2017 at 01:38:01AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   99f691882e7733651625ff23f199c4086dee1f89
> commit: 99f691882e7733651625ff23f199c4086dee1f89 [20/20] hwmon: (pmbus) cffps: Add debugfs entries
> reproduce:
>         # apt-get install sparse
>         git checkout 99f691882e7733651625ff23f199c4086dee1f89
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF=-D__CHECK_ENDIAN__
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
> 
> vim +144 drivers/hwmon/pmbus/ibm-cffps.c
> 
>    116	
>    117	static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
>    118					    size_t count, loff_t *ppos)
>    119	{
>    120		u8 cmd;
>    121		int i, rc;
>    122		int *idxp = file->private_data;
>    123		int idx = *idxp;
>    124		struct ibm_cffps *psu = to_psu(idxp, idx);
>    125		char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
>    126	
>    127		switch (idx) {
>    128		case CFFPS_DEBUGFS_INPUT_HISTORY:
>    129			return ibm_cffps_read_input_history(psu, buf, count, ppos);
>    130		case CFFPS_DEBUGFS_FRU:
>    131			cmd = CFFPS_FRU_CMD;
>    132			break;
>    133		case CFFPS_DEBUGFS_PN:
>    134			cmd = CFFPS_PN_CMD;
>    135			break;
>    136		case CFFPS_DEBUGFS_SN:
>    137			cmd = CFFPS_SN_CMD;
>    138			break;
>    139		case CFFPS_DEBUGFS_CCIN:
>    140			rc = i2c_smbus_read_word_data(psu->client, CFFPS_CCIN_CMD);
>    141			if (rc < 0)
>    142				return rc;
>    143	
>  > 144			rc = snprintf(data, 5, "%04X", be16_to_cpu(rc));

I fixed that up in my tree by calling i2c_smbus_read_word_swapped() above.
No need to send a followup patch.

>    145			goto done;
>    146		case CFFPS_DEBUGFS_FW:
>    147			for (i = 0; i < CFFPS_FW_NUM_BYTES; ++i) {
>    148				rc = i2c_smbus_read_byte_data(psu->client,
>    149							      CFFPS_FW_CMD_START + i);
>    150				if (rc < 0)
>    151					return rc;
>    152	
>    153				snprintf(&data[i * 2], 3, "%02X", rc);
>    154			}
>    155	
>    156			rc = i * 2;
>    157			goto done;
>    158		default:
>    159			return -EINVAL;
>    160		}
>    161	
>    162		rc = i2c_smbus_read_block_data(psu->client, cmd, data);
>    163		if (rc < 0)
>    164			return rc;
>    165	
>    166	done:
>    167		data[rc] = '\n';
>    168		rc += 2;
>    169	
>    170		return simple_read_from_buffer(buf, count, ppos, data, rc);
>    171	}
>    172	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
