Return-path: <f.fainelli@gmail.com>
Date: Sat, 21 Jan 2017 15:11:02 -0800
In-Reply-To: <8ada15e2-2b99-02c3-e731-c469a3d6c3bf@roeck-us.net>
References: <20170121192010.30681-1-f.fainelli@gmail.com> <20170121192010.30681-3-f.fainelli@gmail.com> <8ada15e2-2b99-02c3-e731-c469a3d6c3bf@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] hwmon: (lm70) Add support for TI TMP122/124
To: Guenter Roeck <linux@roeck-us.net>,linux-kernel@vger.kernel.org
CC: Rob Herring <robh+dt@kernel.org>,Mark Rutland <mark.rutland@arm.com>,Jean Delvare <jdelvare@suse.com>,Jonathan Corbet <corbet@lwn.net>,"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <C0A9E7E0-D4AB-4154-BC47-656F8E1FE77E@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

On January 21, 2017 12:25:21 PM PST, Guenter Roeck <linux@roeck-us=2Enet> w=
rote:
>On 01/21/2017 11:20 AM, Florian Fainelli wrote:
>> Add support for Texas Instruments TMP122/124 which are nearly
>identical to
>> their TMP121/123 except that they also support programmable
>temperature
>> thresholds=2E
>>
>> Signed-off-by: Florian Fainelli <f=2Efainelli@gmail=2Ecom>
>
>Applied to -next=2E

Thanks was fast, thanks!

>
>Any plans to add support for the thresholds ?

Yes, as mentioned in the cover letter, need to get SPI_3WIRE working with =
the SPI controller (spi-ep93xx) to verify the thresholds do work=2E

Cheers

--=20
Florian
