Return-Path: <jae.hyun.yoo@linux.intel.com>
Return-path: <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
 <20180110102011.GC5822@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d0977a2f-485c-f425-0a3b-7a20d0292273@linux.intel.com>
Date: Wed, 10 Jan 2018 11:34:54 -0800
MIME-Version: 1.0
In-Reply-To: <20180110102011.GC5822@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 1/10/2018 2:20 AM, Greg KH wrote:
> On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
>> +#pragma pack(push, 1)
>> +struct peci_xfer_msg {
>> +	unsigned char client_addr;
>> +	unsigned char tx_len;
>> +	unsigned char rx_len;
>> +	unsigned char tx_buf[MAX_BUFFER_SIZE];
>> +	unsigned char rx_buf[MAX_BUFFER_SIZE];
>> +};
>> +#pragma pack(pop)
> 
> For any structure that crosses the user/kernel boundry, you _HAVE_ to
> use the "__" variant.  So for here you would use __u8 instead of
> "unsigned char" in order for things to work properly.
> 
> I'm guessing you didn't test this all out on a mixed 32/64 bit system?
> 
> Please fix up and test to ensure that it all works properly before
> resubmitting.
> 
> thanks,
> 
> greg k-h
> 

Thanks for your pointing it out. I'll fix this.

Thanks a lot,
Jae
