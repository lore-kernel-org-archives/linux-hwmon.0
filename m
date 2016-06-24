Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:41672 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751109AbcFXPEF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 11:04:05 -0400
Subject: Re: [PATCH v5 1/1] hwmon: Add support for INA3221 Triple
 Current/Voltage Monitors
To: Guenter Roeck <linux@roeck-us.net>
References: <20160610153233.6169-1-afd@ti.com>
 <20160610153233.6169-2-afd@ti.com> <20160610164435.GA9125@roeck-us.net>
 <5764860E.1040305@ti.com> <576565DB.5040007@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	<linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <576D4B9B.8030503@ti.com>
Date: Fri, 24 Jun 2016 10:02:51 -0500
MIME-Version: 1.0
In-Reply-To: <576565DB.5040007@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/18/2016 10:16 AM, Guenter Roeck wrote:
>
> The chip registers are 16 bit. Can you repeat the command using the "w"
> option ?
> 

# i2cdump -y 2 0x40 w
     0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
00: 2771 0000 0000 0000 0000 0000 0000 f87f
08: f87f f87f f87f f87f f87f 0000 fe7f 0300
10: 1027 2823 ffff ffff ffff ffff ffff ffff
18: ffff ffff XXXX f8f8 ffff ffff 4954 2032
20: 2771 0000 0000 0000 0000 0000 0000 f87f
28: f87f f87f f87f f87f f87f 0000 fe7f 0300
30: 1027 2823 ffff ffff ffff ffff ffff ffff
38: ffff ffff XXXX f8f8 ffff ffff 4954 2032
40: 2771 0000 0000 0000 0000 0000 0000 f87f
48: f87f f87f f87f f87f f87f 0000 fe7f 0300
50: 1027 2823 ffff ffff ffff ffff ffff ffff
58: ffff ffff XXXX f8f8 ffff ffff 4954 2032
60: 2771 0000 0000 0000 0000 0000 0000 f87f
68: f87f f87f f87f f87f f87f 0000 fe7f 0300
70: 1027 2823 ffff ffff ffff ffff ffff ffff
78: ffff ffff XXXX f8f8 ffff ffff 4954 2032
80: 2771 0000 0000 0000 0000 0000 0000 f87f
88: f87f f87f f87f f87f f87f 0000 fe7f 0300
90: 1027 2823 ffff ffff ffff ffff ffff ffff
98: ffff ffff XXXX f8f8 ffff ffff 4954 2032
a0: 2771 0000 0000 0000 0000 0000 0000 f87f
a8: f87f f87f f87f f87f f87f 0000 fe7f 0300
b0: 1027 2823 ffff ffff ffff ffff ffff ffff
b8: ffff ffff XXXX f8f8 ffff ffff 4954 2032
c0: 2771 0000 0000 0000 0000 0000 0000 f87f
c8: f87f f87f f87f f87f f87f 0000 fe7f 0300
d0: 1027 2823 ffff ffff ffff ffff ffff ffff
d8: ffff ffff XXXX f8f8 ffff ffff 4954 2032
e0: 2771 0000 0000 0000 0000 0000 0000 f87f
e8: f87f f87f f87f f87f f87f 0000 fe7f 0300
f0: 1027 2823 ffff ffff ffff ffff ffff ffff
f8: ffff ffff XXXX f8f8 ffff ffff 4954 2032
