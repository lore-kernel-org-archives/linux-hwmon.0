Return-path: <jdelvare@suse.de>
Date: Wed, 25 Jan 2017 14:05:04 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: Update documentation to clarify rules for the
 'name' attribute
Message-ID: <20170125140504.3147055d@endymion>
In-Reply-To: <1485336482-14381-1-git-send-email-linux@roeck-us.net>
References: <1485336482-14381-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 25 Jan 2017 01:28:02 -0800, Guenter Roeck wrote:
> Clarify that the name attribute must report a valid name, and the rules
> for valid names. Also clarify that the name parameter must be provided
> for all supported API functions.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: '.' is an acceptable character in the 'name' attribute.
> 
>  Documentation/hwmon/hwmon-kernel-api.txt | 4 ++++
>  Documentation/hwmon/sysfs-interface      | 5 +++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
> index 2505ae67e2b6..53a806696c64 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.txt
> +++ b/Documentation/hwmon/hwmon-kernel-api.txt
> @@ -89,6 +89,10 @@ the call to devm_hwmon_device_register_with_groups or
>  hwmon_device_register_with_info and if the automatic (device managed)
>  removal would be too late.
>  
> +All supported hwmon device registration functions only accept valid device
> +names. Device names including invalid characters (whitespace, '*', or '-')
> +will be rejected. The 'name' parameter is mandatory.
> +
>  Using devm_hwmon_device_register_with_info()
>  --------------------------------------------
>  
> diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
> index 2cc95ad46604..fc337c317c67 100644
> --- a/Documentation/hwmon/sysfs-interface
> +++ b/Documentation/hwmon/sysfs-interface
> @@ -86,8 +86,9 @@ given driver if the chip has the feature.
>  
>  name		The chip name.
>  		This should be a short, lowercase string, not containing
> -		spaces nor dashes, representing the chip name. This is
> -		the only mandatory attribute.
> +		whitespace, dashes, or the wildcard character '*'.
> +		This attribute represents the chip name. It is the only
> +		mandatory attribute.
>  		I2C devices get this attribute created automatically.
>  		RO
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
