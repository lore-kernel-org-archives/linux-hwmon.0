Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9A545DAB
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082517; cv=none; b=NRTxQCudKSJ11SgTQvSo2qf5B61P0hgjqQUGl3wS8zhOTbe+t9n4cfkaxD49CLlvKCxTinnlk3PJHEJxujPX0LPVlI67lfRYtLTxSPrAIzk9yFdKSeaP5DT9/H7izkQ7Y7OMTYob1KKfVD0Ng51Epm7niOHVAEEbtq3DCCBW0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082517; c=relaxed/simple;
	bh=XDvs73JEy4YKJ3xI09CFbH0vjnY23kj5NZqhBSZ0vDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyH9HextFr/n28oskmRwYT6VCdPXr/mR4+m4gp006X3SRnIhb6CmLPzwlFN0ToElVSIPhnzKtInIf/eDV5mzOCzuhasT+fu4wKitthyipUqpKFmILP8+7ZeTgd7lM2jEc8UjCAJ++OJA/DA/HQ9FMgxrjMMyIaRS8f/e7p0cnWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kN4kCY56; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kN4kCY56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CEC1F00898
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082515;
	bh=dtKSaYNybbuVIWzvAwOFjsM6oYgukInOsGXNCqfyEwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kN4kCY56s49v2NlFU4LDqSGpSfKSf6LJFFZL5L7Deid/4zMgRrRO61l976QcAZr/3
	 TyBt3OVJ5wZkCtbOfgBzEx5HafPdEtE1yt1sdv+uXd5C8V7tN4kLb6NS605asp8vUm
	 wd10fGMqC4m2StXSjsVjQWe/IsPLlrjGp98CjAiNxaSckcLaguYfz/nAHsBRcA4gCU
	 ExqFT6FEXLqpICZ3EDSDEDoD27mgqecd0/V/YKIIsSDLVMrpnd8VGihStdKTsaD5am
	 EmG3XI+VY6uFAqGuZPxREX3J9NmWHPZ6ugyuX6uj94JRSmtD3x7fhgzu0qxpwyG4dS
	 DAJxKIcYgxzSA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a318299b93so35939711fa.0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 06:08:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzybzXhBUh7FwWbbreYHOUibs1995RX8gnMUTV2kANBZoJmG94m67RejP2/BlbaALFtNkK3cyUWKFYJRw==@vger.kernel.org
X-Gm-Message-State: AFuF++kfwkdtNoILtOIetQt/ZfasWtHILnug3Zebhid1COOpXfWr0+JP
	DIUOY08aGauXM9H4LAegjkpTPjnh12+A8TfFRVpo4ShGXYZcQLvKuMYjjEXQGtrIEyJtS4Q/FBh
	+MwoSUztaC/R6Hown9eaMxpMiFv2JZ4g=
X-Received: by 2002:a05:651c:1503:b0:3a2:fda9:34fd with SMTP id
 38308e7fff4ca-3a5fbec15ecmr31018991fa.9.1790082513680; Tue, 22 Sep 2026
 06:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918175052.85461-1-jordan@brough.org> <20260918175052.85461-2-jordan@brough.org>
In-Reply-To: <20260918175052.85461-2-jordan@brough.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 22 Sep 2026 15:07:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gM8YUJZa=FR1=kr=cfe51zt6TJk60ibjZSnJ+tnpTGcQ@mail.gmail.com>
X-Gm-Features: AcwNN1WOr_tMZwh9YG_OEze1vmkQnJ7QsHvEZpUx9Fku7T4MiH7ZogSUlPuAwKs
Message-ID: <CAJZ5v0gM8YUJZa=FR1=kr=cfe51zt6TJk60ibjZSnJ+tnpTGcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: battery: add unified battery hook mechanism
 for ACPI and SBS batteries
To: Jordan Brough <jordan@brough.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Henrik Rydberg <rydberg@bitmath.se>, linux-hwmon@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 7:51=E2=80=AFPM Jordan Brough <jordan@brough.org> w=
rote:
>
> drivers/acpi/battery.c provides a battery_hook_register()/unregister()
> mechanism that lets other drivers (e.g. platform and hwmon drivers
> exposing vendor-specific charge control) attach extra power_supply
> properties to an ACPI Control Method Battery (HID PNP0C0A).
>
> Some machines instead expose their battery through the ACPI Smart
> Battery System (HID ACPI0002, "SBS") driver in drivers/acpi/sbs.c,
> which has had no equivalent hook point.
>
> Extract the battery hooking implementation out of drivers/acpi/battery.c
> into a shared helper in drivers/acpi/battery_hook.c, built directly into
> the ACPI core (acpi.o). Both drivers/acpi/battery.c and drivers/acpi/sbs.=
c
> now register their power_supply devices with this shared hook
> infrastructure via battery_hook_add_battery() and
> battery_hook_remove_battery().
>
> This unifies the hooking interface across both battery drivers so
> callers only need to register a single struct acpi_battery_hook without
> needing to know or care whether the underlying hardware exposes a Control
> Method Battery or an SBS battery.
>
> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Signed-off-by: Jordan Brough <jordan@brough.org>
> ---
>  drivers/acpi/Makefile       |   1 +
>  drivers/acpi/battery.c      | 165 +-----------------------------------
>  drivers/acpi/battery_hook.c | 112 ++++++++++++++++++++++++
>  drivers/acpi/sbs.c          |   8 +-
>  include/acpi/battery.h      |  10 +++
>  5 files changed, 133 insertions(+), 163 deletions(-)
>  create mode 100644 drivers/acpi/battery_hook.c
>
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index d1b0affb844..57413f2a09e 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_ACPI)            +=3D acpi.o \
>  # All the builtin files are in the "acpi." module_param namespace.
>  acpi-y                         +=3D osi.o osl.o utils.o reboot.o
>  acpi-y                         +=3D nvs.o
> +acpi-y                         +=3D battery_hook.o

s/battery_hook/battery_hooks/

And surely it need not be compiled in without any users built at least
as modules.

>
>  # Power management related files
>  acpi-y                         +=3D wakeup.o
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index 670853ec3a4..9b6af528bfe 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -105,7 +105,7 @@ struct acpi_battery {
>         struct kfifo acpi_notif_fifo;
>         struct delayed_work acpi_notif_dwork;
>         struct notifier_block pm_nb;
> -       struct list_head list;
> +       struct acpi_battery_hook_device hook_dev;

struct acpi_battery_hooks_list_entry hooks_list_entry;

>         unsigned long flags;
>
>         struct mutex property_lock; /* Protects properties below. */
> @@ -744,164 +744,6 @@ static struct attribute *acpi_battery_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(acpi_battery);
>
> -/*
> - * The Battery Hooking API
> - *
> - * This API is used inside other drivers that need to expose
> - * platform-specific behaviour within the generic driver in a
> - * generic way.
> - *
> - */
> -
> -static LIST_HEAD(acpi_battery_list);
> -static LIST_HEAD(battery_hook_list);
> -static DEFINE_MUTEX(hook_mutex);
> -
> -static void battery_hook_unregister_unlocked(struct acpi_battery_hook *h=
ook)
> -{
> -       struct acpi_battery *battery;
> -
> -       /*
> -        * In order to remove a hook, we first need to
> -        * de-register all the batteries that are registered.
> -        */
> -       list_for_each_entry(battery, &acpi_battery_list, list) {
> -               if (!hook->remove_battery(battery->bat, hook))
> -                       power_supply_changed(battery->bat);
> -       }
> -       list_del_init(&hook->list);
> -
> -       pr_info("hook unregistered: %s\n", hook->name);
> -}
> -
> -void battery_hook_unregister(struct acpi_battery_hook *hook)
> -{
> -       mutex_lock(&hook_mutex);
> -       /*
> -        * Ignore already unregistered battery hooks. This might happen
> -        * if a battery hook was previously unloaded due to an error when
> -        * adding a new battery.
> -        */
> -       if (!list_empty(&hook->list))
> -               battery_hook_unregister_unlocked(hook);
> -
> -       mutex_unlock(&hook_mutex);
> -}
> -EXPORT_SYMBOL_GPL(battery_hook_unregister);
> -
> -void battery_hook_register(struct acpi_battery_hook *hook)
> -{
> -       struct acpi_battery *battery;
> -
> -       mutex_lock(&hook_mutex);
> -       list_add(&hook->list, &battery_hook_list);
> -       /*
> -        * Now that the driver is registered, we need
> -        * to notify the hook that a battery is available
> -        * for each battery, so that the driver may add
> -        * its attributes.
> -        */
> -       list_for_each_entry(battery, &acpi_battery_list, list) {
> -               if (hook->add_battery(battery->bat, hook)) {
> -                       /*
> -                        * If a add-battery returns non-zero,
> -                        * the registration of the hook has failed,
> -                        * and we will not add it to the list of loaded
> -                        * hooks.
> -                        */
> -                       pr_err("hook failed to load: %s", hook->name);
> -                       battery_hook_unregister_unlocked(hook);
> -                       goto end;
> -               }
> -
> -               power_supply_changed(battery->bat);
> -       }
> -       pr_info("new hook: %s\n", hook->name);
> -end:
> -       mutex_unlock(&hook_mutex);
> -}
> -EXPORT_SYMBOL_GPL(battery_hook_register);
> -
> -static void devm_battery_hook_unregister(void *data)
> -{
> -       struct acpi_battery_hook *hook =3D data;
> -
> -       battery_hook_unregister(hook);
> -}
> -
> -int devm_battery_hook_register(struct device *dev, struct acpi_battery_h=
ook *hook)
> -{
> -       battery_hook_register(hook);
> -
> -       return devm_add_action_or_reset(dev, devm_battery_hook_unregister=
, hook);
> -}
> -EXPORT_SYMBOL_GPL(devm_battery_hook_register);
> -
> -/*
> - * This function gets called right after the battery sysfs
> - * attributes have been added, so that the drivers that
> - * define custom sysfs attributes can add their own.
> - */
> -static void battery_hook_add_battery(struct acpi_battery *battery)
> -{
> -       struct acpi_battery_hook *hook_node, *tmp;
> -
> -       mutex_lock(&hook_mutex);
> -       INIT_LIST_HEAD(&battery->list);
> -       list_add(&battery->list, &acpi_battery_list);
> -       /*
> -        * Since we added a new battery to the list, we need to
> -        * iterate over the hooks and call add_battery for each
> -        * hook that was registered. This usually happens
> -        * when a battery gets hotplugged or initialized
> -        * during the battery module initialization.
> -        */
> -       list_for_each_entry_safe(hook_node, tmp, &battery_hook_list, list=
) {
> -               if (hook_node->add_battery(battery->bat, hook_node)) {
> -                       /*
> -                        * The notification of the hook has failed, to
> -                        * prevent further errors we will unload the hook=
.
> -                        */
> -                       pr_err("error in hook, unloading: %s",
> -                                       hook_node->name);
> -                       battery_hook_unregister_unlocked(hook_node);
> -               }
> -       }
> -       mutex_unlock(&hook_mutex);
> -}
> -
> -static void battery_hook_remove_battery(struct acpi_battery *battery)
> -{
> -       struct acpi_battery_hook *hook;
> -
> -       mutex_lock(&hook_mutex);
> -       /*
> -        * Before removing the hook, we need to remove all
> -        * custom attributes from the battery.
> -        */
> -       list_for_each_entry(hook, &battery_hook_list, list) {
> -               hook->remove_battery(battery->bat, hook);
> -       }
> -       /* Then, just remove the battery from the list */
> -       list_del(&battery->list);
> -       mutex_unlock(&hook_mutex);
> -}
> -
> -static void __exit battery_hook_exit(void)
> -{
> -       struct acpi_battery_hook *hook;
> -       struct acpi_battery_hook *ptr;
> -       /*
> -        * At this point, the acpi_bus_unregister_driver()
> -        * has called remove for all batteries. We just
> -        * need to remove the hooks.
> -        */
> -       list_for_each_entry_safe(hook, ptr, &battery_hook_list, list) {
> -               battery_hook_unregister(hook);
> -       }
> -       mutex_destroy(&hook_mutex);
> -}
> -
>  static int sysfs_add_battery(struct acpi_battery *battery)
>  {
>         struct power_supply_config psy_cfg =3D {
> @@ -957,7 +799,7 @@ static int sysfs_add_battery(struct acpi_battery *bat=
tery)
>                 battery->bat =3D NULL;
>                 return result;
>         }
> -       battery_hook_add_battery(battery);
> +       battery_hook_add_battery(&battery->hook_dev, battery->bat);

acpi_battery_add_hooks(&battery->hooks_list_entry, battery->bat);

>         return 0;
>  }
>
> @@ -966,7 +808,7 @@ static void sysfs_remove_battery(struct acpi_battery =
*battery)
>         if (!battery->bat)
>                 return;
>
> -       battery_hook_remove_battery(battery);
> +       battery_hook_remove_battery(&battery->hook_dev);

acpi_battery_remove_hooks(...)

>         power_supply_unregister(battery->bat);
>         battery->bat =3D NULL;
>  }
> @@ -1476,7 +1318,6 @@ static int __init acpi_battery_init(void)
>  static void __exit acpi_battery_exit(void)
>  {
>         platform_driver_unregister(&acpi_battery_driver);
> -       battery_hook_exit();
>  }
>
>  module_init(acpi_battery_init);
> diff --git a/drivers/acpi/battery_hook.c b/drivers/acpi/battery_hook.c
> new file mode 100644
> index 00000000000..308d10c940e
> --- /dev/null
> +++ b/drivers/acpi/battery_hook.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ACPI Battery Hooking API

s/Hooking/Hooks/

> + *
> + * Provides a common registration and notification framework for drivers
> + * that attach platform-specific properties or extensions to ACPI-regist=
ered
> + * batteries (both ACPI Control Method batteries and Smart Battery Syste=
ms).

"Provides helpers for registering and unregistering battery hooks for
drivers that use platform-specific extensions to ACPI-enumerated
batteries (both ACPI Control Method batteries and Smart Battery System
batteries)."

> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/power_supply.h>
> +#include <acpi/battery.h>
> +
> +static LIST_HEAD(acpi_battery_list);
> +static LIST_HEAD(battery_hook_list);
> +static DEFINE_MUTEX(hook_mutex);
> +
> +static void battery_hook_unregister_unlocked(struct acpi_battery_hook *h=
ook)

Please add acpi_ prefix to all function names here and below.

> +{
> +       struct acpi_battery_hook_device *hook_dev;

struct acpi_battery_hooks_list_entry *entry;

and analogously below.

> +
> +       list_for_each_entry(hook_dev, &acpi_battery_list, list) {
> +               if (!hook->remove_battery(hook_dev->battery, hook))
> +                       power_supply_changed(hook_dev->battery);
> +       }
> +       list_del_init(&hook->list);
> +
> +       pr_info("hook unregistered: %s\n", hook->name);
> +}
> +
> +void battery_hook_unregister(struct acpi_battery_hook *hook)
> +{
> +       mutex_lock(&hook_mutex);

This code is different from the code removed from battery.c, so please
use mutex locking guards in it.

> +       if (!list_empty(&hook->list))
> +               battery_hook_unregister_unlocked(hook);
> +       mutex_unlock(&hook_mutex);
> +}
> +EXPORT_SYMBOL_GPL(battery_hook_unregister);
> +
> +void battery_hook_register(struct acpi_battery_hook *hook)
> +{
> +       struct acpi_battery_hook_device *hook_dev;
> +
> +       mutex_lock(&hook_mutex);
> +       list_add(&hook->list, &battery_hook_list);
> +
> +       list_for_each_entry(hook_dev, &acpi_battery_list, list) {
> +               if (hook->add_battery(hook_dev->battery, hook)) {
> +                       pr_err("hook failed to load: %s\n", hook->name);
> +                       battery_hook_unregister_unlocked(hook);
> +                       goto end;
> +               }
> +
> +               power_supply_changed(hook_dev->battery);
> +       }
> +       pr_info("new hook: %s\n", hook->name);
> +end:
> +       mutex_unlock(&hook_mutex);
> +}
> +EXPORT_SYMBOL_GPL(battery_hook_register);
> +
> +static void devm_battery_hook_unregister(void *data)
> +{
> +       struct acpi_battery_hook *hook =3D data;
> +
> +       battery_hook_unregister(hook);
> +}
> +
> +int devm_battery_hook_register(struct device *dev, struct acpi_battery_h=
ook *hook)

devm_acpi_battery_hook_register(...)

> +{
> +       battery_hook_register(hook);
> +
> +       return devm_add_action_or_reset(dev, devm_battery_hook_unregister=
, hook);
> +}
> +EXPORT_SYMBOL_GPL(devm_battery_hook_register);
> +
> +void battery_hook_add_battery(struct acpi_battery_hook_device *hook_dev,
> +                             struct power_supply *battery)

void acpi_battery_add_hooks(struct acpi_battery_hooks_list_entry *entry,

and analogously for the removal function below.

> +{
> +       struct acpi_battery_hook *hook_node, *tmp;
> +
> +       hook_dev->battery =3D battery;
> +       mutex_lock(&hook_mutex);
> +       INIT_LIST_HEAD(&hook_dev->list);
> +       list_add(&hook_dev->list, &acpi_battery_list);
> +
> +       list_for_each_entry_safe(hook_node, tmp, &battery_hook_list, list=
) {
> +               if (hook_node->add_battery(hook_dev->battery, hook_node))=
 {
> +                       pr_err("error in hook, unloading: %s\n", hook_nod=
e->name);
> +                       battery_hook_unregister_unlocked(hook_node);
> +               }
> +       }
> +       mutex_unlock(&hook_mutex);
> +}
> +EXPORT_SYMBOL_GPL(battery_hook_add_battery);

Use a symbol export namespace for this.

> +
> +void battery_hook_remove_battery(struct acpi_battery_hook_device *hook_d=
ev)
> +{
> +       struct acpi_battery_hook *hook;
> +
> +       mutex_lock(&hook_mutex);
> +       list_for_each_entry(hook, &battery_hook_list, list)
> +               hook->remove_battery(hook_dev->battery, hook);
> +
> +       list_del(&hook_dev->list);
> +       hook_dev->battery =3D NULL;
> +       mutex_unlock(&hook_mutex);
> +}
> +EXPORT_SYMBOL_GPL(battery_hook_remove_battery);

And for this too.

> diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
> index 86b7c797585..a2f27c0d233 100644
> --- a/drivers/acpi/sbs.c
> +++ b/drivers/acpi/sbs.c
> @@ -10,6 +10,7 @@
>  #define pr_fmt(fmt) "ACPI: " fmt
>
>  #include <linux/init.h>
> +#include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> @@ -54,6 +55,7 @@ struct acpi_battery {
>         struct power_supply *bat;
>         struct power_supply_desc bat_desc;
>         struct acpi_sbs *sbs;
> +       struct acpi_battery_hook_device hook_dev;

struct acpi_battery_hooks_list_entry hooks_list_entry;

>         unsigned long update_time;
>         char name[8];
>         char manufacturer_name[ACPI_SBS_BLOCK_MAX];
> @@ -555,6 +557,8 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int=
 id)
>                 goto end;
>         }
>
> +       battery_hook_add_battery(&battery->hook_dev, battery->bat);

acpi_battery_add_hooks(&battery->hook_list_entry, battery->bat);

> +
>        end:
>         pr_info("%s [%s]: Battery Slot [%s] (battery %s)\n",
>                ACPI_SBS_DEVICE_NAME, acpi_device_bid(sbs->device),
> @@ -566,8 +570,10 @@ static void acpi_battery_remove(struct acpi_sbs *sbs=
, int id)
>  {
>         struct acpi_battery *battery =3D &sbs->battery[id];
>
> -       if (battery->bat)
> +       if (battery->bat) {
> +               battery_hook_remove_battery(&battery->hook_dev);

acpi_battery_remove_hooks(...);

>                 power_supply_unregister(battery->bat);
> +       }
>  }
>
>  static int acpi_charger_add(struct acpi_sbs *sbs)
> diff --git a/include/acpi/battery.h b/include/acpi/battery.h
> index c93f16dfb94..df5087c0529 100644
> --- a/include/acpi/battery.h
> +++ b/include/acpi/battery.h
> @@ -3,6 +3,7 @@
>  #define __ACPI_BATTERY_H
>
>  #include <linux/device.h>
> +#include <linux/list.h>
>  #include <linux/power_supply.h>
>
>  #define ACPI_BATTERY_CLASS "battery"
> @@ -18,8 +19,17 @@ struct acpi_battery_hook {
>         struct list_head list;
>  };
>
> +struct acpi_battery_hook_device {

struct acpi_battery_hooks_list_entry {

> +       struct power_supply *battery;
> +       struct list_head list;

struct list_head list_entry;
struct power_supply *battery;

> +};
> +
>  void battery_hook_register(struct acpi_battery_hook *hook);
>  void battery_hook_unregister(struct acpi_battery_hook *hook);
>  int devm_battery_hook_register(struct device *dev, struct acpi_battery_h=
ook *hook);
>
> +void battery_hook_add_battery(struct acpi_battery_hook_device *hook_dev,
> +                             struct power_supply *battery);
> +void battery_hook_remove_battery(struct acpi_battery_hook_device *hook_d=
ev);
> +
>  #endif
> --

HTH
