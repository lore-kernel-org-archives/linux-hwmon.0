Return-path: <eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 02 Feb 2017 09:06:36 -0600
From: eajames <eajames@linux.vnet.ibm.com>
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        mark.rutland@arm.com, wsa@the-dreams.de, andrew@aj.id.au,
        joel@jms.id.au, benh@kernel.crashing.org,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH linux v5 5/6] hwmon: occ: Add hwmon implementation for the
 P8 OCC
In-Reply-To: <20170201173450.ysuk3j2hwoldz72o@rob-hp-laptop>
References: <1485877437-13598-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
 <20170201173450.ysuk3j2hwoldz72o@rob-hp-laptop>
Message-Id: <87f4e9636acbcc5facc169d590b110cb@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

On 2017-02-01 11:34, Rob Herring wrote:
> On Tue, Jan 31, 2017 at 09:43:56AM -0600, eajames@linux.vnet.ibm.com 
> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>> 
>> Add code to tie the hwmon sysfs code and the POWER8 OCC code together, 
>> as
>> well as probe the entire driver from the I2C bus. I2C is the 
>> communication
>> method between the BMC and the P8 OCC.
>> 
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +++
> 
> Please add acks when posting new versions.

Thanks Rob, should I put up a new version with acked by, and no other 
changes? Also, do you mean to acknowledge this patch only, or all the 
patches? I'm new to this process...

Thanks,
Eddie

> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
>>  drivers/hwmon/occ/Kconfig                       |  14 ++++
>>  drivers/hwmon/occ/Makefile                      |   1 +
>>  drivers/hwmon/occ/p8_occ_i2c.c                  | 104 
>> ++++++++++++++++++++++++
>>  4 files changed, 132 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
>>  create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c
