Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sun, 1 Oct 2017 07:21:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: ALKML <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
        Roy Franz <roy.franz@cavium.com>,
        Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, Loc Ho <lho@apm.com>,
        Alexey Klimov <alexey.klimov@arm.com>,
        Ryan Harkin <Ryan.Harkin@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: [v3, 19/22] hwmon: (core) Add hwmon_max to hwmon_sensor_types
 enumeration
Message-ID: <20171001142111.GA32735@roeck-us.net>
References: <1506604306-20739-20-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506604306-20739-20-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 28, 2017 at 02:11:43PM +0100, Sudeep Holla wrote:
> It's useful to know the maximum types of sensor supported by hwmon
> framework. It can be used to allocate some data structures when sorting
> the monitors based on their type.
> 
> This will be used by scmi hwmon support.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/linux/hwmon.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index ceb751987c40..e5fd2707b6df 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -29,6 +29,7 @@ enum hwmon_sensor_types {
>  	hwmon_humidity,
>  	hwmon_fan,
>  	hwmon_pwm,
> +	hwmon_max,
>  };
>  
>  enum hwmon_chip_attributes {
