Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34238 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757098AbcIAVI7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2016 17:08:59 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2364486049
        for <linux-hwmon@vger.kernel.org>; Fri,  2 Sep 2016 09:08:56 +1200 (NZST)
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>,
        Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: adt7470: Allow faster removal
Date: Thu, 1 Sep 2016 21:08:54 +0000
Message-ID: <c295f9ed1a744f35823c067b7434591b@svr-chch-ex1.atlnz.lc>
References: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
 <61bb13ce-5040-40d8-c824-624a3cf08cf1@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter, Jean,=0A=
=0A=
On 09/02/2016 12:12 AM, Guenter Roeck wrote:=0A=
> On 08/31/2016 10:17 PM, Joshua Scott wrote:=0A=
>> adt7470_remove will wait for the update thread to complete before=0A=
>> returning. This has a worst-case time of up to the user-configurable=0A=
>> auto_update_interval.=0A=
>>=0A=
>> Break this delay into smaller slices to allow the thread to exit quickly=
=0A=
>> when adt7470_remove is called.=0A=
>>=0A=
>> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>  drivers/hwmon/adt7470.c | 15 +++++++++++----=0A=
>>  1 file changed, 11 insertions(+), 4 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c=0A=
>> index 7d185a9..ba97392 100644=0A=
>> --- a/drivers/hwmon/adt7470.c=0A=
>> +++ b/drivers/hwmon/adt7470.c=0A=
>> @@ -268,14 +268,21 @@ static int adt7470_update_thread(void *p)=0A=
>>  {=0A=
>>  	struct i2c_client *client =3D p;=0A=
>>  	struct adt7470_data *data =3D i2c_get_clientdata(client);=0A=
>> +	unsigned long next_read =3D jiffies - 1;=0A=
>>=0A=
>>  	while (!kthread_should_stop()) {=0A=
>> -		mutex_lock(&data->lock);=0A=
>> -		adt7470_read_temperatures(client, data);=0A=
>> -		mutex_unlock(&data->lock);=0A=
>> +=0A=
>> +		if (time_after_eq(jiffies, next_read)) {=0A=
>> +			next_read =3D jiffies + data->auto_update_interval * HZ / 1000;=0A=
>> +			mutex_lock(&data->lock);=0A=
>> +			adt7470_read_temperatures(client, data);=0A=
>> +			mutex_unlock(&data->lock);=0A=
>> +		}=0A=
>> +=0A=
>> +		msleep_interruptible(1);=0A=
>> +=0A=
>=0A=
>=0A=
> This puts a heavy burden on the system, forcing it to run every ms, just =
for=0A=
> the unlikely case of driver removal. Why is quick removal so important ?=
=0A=
> If it is, we'll have to find a better solution.=0A=
>=0A=
> Guenter=0A=
>=0A=
=0A=
The particular use case we have is a chassis based system with an =0A=
adt7470 on a removable fan-tray. The problem is that when the fan tray =0A=
is removed it takes auto_update_interval/1000 seconds for the update =0A=
thread to stop and the i2c device to be removed. In the intervening time =
=0A=
a new fan-tray could have been installed.=0A=
=0A=
>>  		if (kthread_should_stop())=0A=
>>  			break;=0A=
>> -		msleep_interruptible(data->auto_update_interval);=0A=
>>  	}=0A=
>>=0A=
>>  	complete_all(&data->auto_update_stop);=0A=
>>=0A=
=0A=
On 09/01/2016 08:18 PM, Jean Delvare wrote:=0A=
>=0A=
> This change looks terribly costly to me. In order to shorten the=0A=
> duration of a rare event (you don't "rmmod adt7470" on a regular basis,=
=0A=
> do you?)=0A=
=0A=
It's worse than that. We're not doing rmmod, hardware is physically =0A=
being removed.=0A=
=0A=
> you increase the cost of a kernel thread which runs all the=0A=
> time. I'm afraid this msleep_interruptible(1) is going to prevent the=0A=
> CPU from entering low power states at all, leading to an increased=0A=
> system temperature and power consumption. Have you compared the output=0A=
> of "powertop" (specifically the "Idle stats" section) before and after=0A=
> your patch?=0A=
>=0A=
> Is there no way to voluntarily interrupt this long msleep_interruptible?=
=0A=
>=0A=
=0A=
If there is I'd like to know. That would be the ideal solution for us.=0A=
=0A=
=0A=
