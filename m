Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:40724 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbeGKEUQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 00:20:16 -0400
Received: by mail-pf0-f195.google.com with SMTP id e13-v6so4148104pff.7
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jul 2018 21:17:57 -0700 (PDT)
Subject: Re: hwmon driver with misc interface
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
 <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
 <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
 <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
 <516bc180-624f-3645-7f2d-27397ee720b3@linux.vnet.ibm.com>
 <20180710204412.GA26666@roeck-us.net>
 <5437584ecc9db993bbba1cc81f70e241a5507023.camel@kernel.crashing.org>
 <42a49baad45d67b280c8605c0e22d9fd1ab008aa.camel@kernel.crashing.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4f80f6ef-0595-354a-0985-05ad411fe44c@roeck-us.net>
Date: Tue, 10 Jul 2018 21:17:54 -0700
MIME-Version: 1.0
In-Reply-To: <42a49baad45d67b280c8605c0e22d9fd1ab008aa.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/10/2018 07:54 PM, Benjamin Herrenschmidt wrote:
> On Wed, 2018-07-11 at 09:26 +1000, Benjamin Herrenschmidt wrote:
>> On Tue, 2018-07-10 at 13:44 -0700, Guenter Roeck wrote:
>>>>> Yes, I think that would be more appropriate.
>>>>
>>>> This still won't work, since then we wouldn't have those attributes
>>>> available in the P8 version of the driver (which has no fsi-occ driver). In
>>>> addition, how would the poll response data get from the hwmon driver to the
>>>> fsi-occ driver? Yet another interface? Seems awkward.
>>>>
>>>> How about debugfs? We don't really mind where the attributes are, just that
>>>> the data is exposed somewhere...
>>>>
>>>
>>> You are essentially confirming that using sysfs attributes would not be
>>> appropriate. I have no problems with using debugfs; you have a free ride
>>> there.
>>
>> I disagree.
>>
>> If the attributes are used for the normal operation of the system then
>> they should be in sysfs.
>>
>> A system should be able to function normally without debugfs mounted.
>>
>> Those attributes are about monitoring proper operations of the OCC
>> right ? Or are there other things here ? I don't see any reason why
>> those couldn't hang off the device sysfs node...
> 
> Eddie: If Guenter really strongly objects to that handful of attributes

Please keep in mind that you are not making a string case for those attributes,
whatever they are. Saying that debugfs may be a solution isn't really a strong
case; it is exactly the opposite.

I am pushing back because I have seen too many "I want to have this
attribute because the HW supports it. I have no clue what to use it
for, I just want it". I'll want to see something better than that.

Guenter

> being in the hwmon device itself, then we have two alternatives we can
> consider:
> 
>    - Not upstream P8 :-)
> 
>    - Use a similar 2-level driver for P8/i2c, which additionally
> provides the ability to create a p8 variant of /dev/occ if needed.
> 
> I don't like the way the P8 backend works today anyway. It basically
> uses i2c to do SCOMs which will race/clash with anything else in the
> system trying to do the same.
> 
> We should ideally have a pure "SCOM" driver providing a P8 /dev/scom
> and lay on top of that a platform device for OCC like we do with
> sbefifo.
> 
> That said, I'm also not too fussed about leaving P8 behind as legacy
> and not upstreaming it.
> 
> Cheers,
> Ben.
>>
>> Cheers,
>> Ben.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

