Return-path: <fedora@leemhuis.info>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <201605271245.47383@pali>
 <01084692-618a-31db-76f8-60176d1cd2cc@leemhuis.info>
 <201605271521.10294@pali>
Cc: Jan C Peters <jcpeters89@gmail.com>,
 =?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Thorsten Leemhuis <fedora@leemhuis.info>
Message-ID: <b15e8039-f5e4-b373-7a0d-397a92f873b6@leemhuis.info>
Date: Mon, 30 May 2016 13:45:51 +0200
MIME-Version: 1.0
In-Reply-To: <201605271521.10294@pali>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Pali Rohár wrote on 27.05.2016 15:21:
> On Friday 27 May 2016 15:05:54 Thorsten Leemhuis wrote:
>> Pali Rohár wrote on 27.05.2016 12:45:
>> So I tried a few things
>> and came to the conclusion: the problem shows up as soon as
>> i8k_get_fan_type() (introduced in f989e55452) is called somewhere.
> So, once kernel call i8k_get_fan_type() function, then fan speed going 
> up/down?

Yes.

> To make sure that this is root of your problem, can you take some older 
> kernel version (where is i8k working fine) and try to patch+call that 
> i8k_get_fan_type() function? To check that something else cannot 
> interference with it...

I just tried with 3.19.8 (had to install a older distro first :-/ ),
where the problem does not show up (I verified just to be sure). Then I
applied below patch and voila: the fan speed starts going up/down.

IOW: From what I can see that SMM call that i8k_get_fan_type() triggers
the problem on my Studio 8000

CU, knurd

--- i8k.c-unmodified	2016-05-30 13:04:32.980825405 +0200
+++ i8k.c	2016-05-30 13:25:03.186630115 +0200
@@ -41,6 +41,7 @@
 #define I8K_SMM_SET_FAN		0x01a3
 #define I8K_SMM_GET_FAN		0x00a3
 #define I8K_SMM_GET_SPEED	0x02a3
+#define I8K_SMM_GET_FAN_TYPE   0x03a3
 #define I8K_SMM_GET_TEMP	0x10a3
 #define I8K_SMM_GET_DELL_SIG1	0xfea3
 #define I8K_SMM_GET_DELL_SIG2	0xffa3
@@ -275,6 +276,19 @@
 	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * i8k_fan_mult;
 }

+
+/*
+ * Read the fan type.
+ */
+static int i8k_get_fan_type(int fan)
+{
+	struct smm_regs regs = { .eax = I8K_SMM_GET_FAN_TYPE, };
+
+	regs.ebx = fan & 0xff;
+	return i8k_smm(&regs) ? : regs.eax & 0xff;
+}
+
+
 /*
  * Set the fan speed (off, low, high). Returns the new fan status.
  */
@@ -870,6 +884,9 @@
 	if (err)
 		goto exit_remove_proc;

+	// calling i8k_get_fan_type once
+	printk("testing i8k_get_fan_type (%d)", i8k_get_fan_type(0));
+
 	return 0;

  exit_remove_proc:
