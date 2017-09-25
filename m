Return-Path: <dcb314@hotmail.com>
Return-path: <dcb314@hotmail.com>
From: David Binderman <dcb314@hotmail.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: linux-4.14-rc2/drivers/hwmon/pmbus/pmbus_core.c:1086]: (style)
 Redundant condition
Date: Mon, 25 Sep 2017 13:54:02 +0000
Message-ID: <VI1PR0802MB23367050B5690DAC7D654F0B9C7A0@VI1PR0802MB2336.eurprd08.prod.outlook.com>
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


Hello there,

linux-4.14-rc2/drivers/hwmon/pmbus/pmbus_core.c:1086]: (style) Redundant co=
ndition: upper. '!upper || (upper && data->has_status_word)' is equivalent =
to '!upper || data->has_status_word'

Source code is

           (!upper || (upper && data->has_status_word)) &&

Regards

David Binderman=
