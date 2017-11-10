Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:56356 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755657AbdKJDFl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Nov 2017 22:05:41 -0500
MIME-Version: 1.0
In-Reply-To: <20171108175906.GA18718@roeck-us.net>
References: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
 <1510043274-4778-3-git-send-email-mine260309@gmail.com> <f02b61f8-ebda-6bfd-ec4e-d64b3bd488b4@roeck-us.net>
 <CAARXrt=zi4DpGVpH5Cjsr8+m20LdG7JXf7jRqzfzcSJ4isa97g@mail.gmail.com> <20171108175906.GA18718@roeck-us.net>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 10 Nov 2017 11:05:39 +0800
Message-ID: <CAARXrt=uY=gnmuq4AyXa458L1Pw3YOaMwGL=TYwwtThVVH4=Kw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drivers: hwmon: Add W83773G driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 9, 2017 at 1:59 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Nov 08, 2017 at 02:03:34PM +0800, Lei YU wrote:
>> On Tue, Nov 7, 2017 at 10:33 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> > On 11/07/2017 12:27 AM, Lei YU wrote:
>> >>
>> >> Nuvoton W83773G is a hardware monitor IC providing one local
>> >> temperature and two remote temperature sensors.
>> >>
>> >> Signed-off-by: Lei YU <mine260309@gmail.com>
>> >> ---
>> >> v2:
>> >>   - Rewrite the driver using regmap
>> >>   - Add offset and update_interval
> [ ... ]
>
>> >> +       hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>> >> client->name,
>> >> +                                                     regmap,
>> >> w83773g_groups);
>> >
>> >
>> > You lost me here. Why did you stop using the new API ?
>>
>> I was referencing some other hwmon driver (e.g. tmp401.c) and find out
>> the usage of SENSOR_DEVICE_ATTR, which I feel more clear and straightforward.
>>
>
> The new API is supposed to replace the old API to make it independent from
> sysfs and to simplify the actual driver code. On a driver like this, using
> the new API should reduce code and data size by 30% or more.
>
> If you find the new API to be less clear and less straigtforward to use than
> the old API, we need to improve it. Do you have any suggestions ?
>

Thanks for the explanation.
I have sent the v3 patch using the new API.
And I do compare the binary size and it is smaller with the new API, great!

> Thanks,
> Guenter
