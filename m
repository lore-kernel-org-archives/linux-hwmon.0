Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66038C433E1
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 15:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE5E320735
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 15:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QLxbG3Ee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgHPPX0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 11:23:26 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:39618 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgHPPXY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 11:23:24 -0400
Date:   Sun, 16 Aug 2020 15:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597591397;
        bh=60EF42+uzI4fZLF+8YvOH0pcCTaa1/7yhqpZvJa8dIQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QLxbG3EeVQni/ylkBnkgh03awLgA+PoGvx4c3rm3eK1tH0np6hRTWV/icUDJWPqIY
         oTFQ+q19jVBsoenvVKjB7yCQOsQPVFHJeiWc8q0FzqbZ/TJxTkpeZeQsrgVqWwdEFn
         lTJKV6NWQR+/dya/66wFBrGoh1Yhb7ib+me5FuxM=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V5] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <W-BU2h4EaZ7Mkux9N8n5gAkJqGXf2DjXOpj8ik1rbBrdMBvc_OyDzUfJZdtaZ_BXMd2qTtQksE9ptwMkYa_igP-QXqaYlDG5RaMUBVAaM54=@protonmail.com>
In-Reply-To: <20200816095500.123839-1-jaap.aarts1@gmail.com>
References: <20200816095500.123839-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

I added a couple notes about the code inline.


> [...]
> +#define MAX_FAN_COUNT 2
> +#define MAX_PWM_CHANNEL_COUNT MAX_FAN_COUNT
> +
> +struct hwmon_data {
> +=09struct hydro_i_pro_device *hdev;
> +=09int channel_count;

This is a nitpick, but the 'channel_count' value comes from the 'fancount'
of an entry of 'config_table', which has type 'u8', so I don't see any need=
 for
it to be an 'int'.

> +=09void *channel_data[MAX_PWM_CHANNEL_COUNT];
> +};
> [...]
> +struct curve_point quiet_curve[FAN_CURVE_COUNT] =3D {

This should be 'static' (and possibly 'const'?).


> +=09{
> +=09=09.temp =3D 0x1F,
> +=09=09.pwm =3D 0x15,
> +=09},
> +=09{
> +=09=09.temp =3D 0x21,
> +=09=09.pwm =3D 0x1E,
> +=09},
> +=09{
> +=09=09.temp =3D 0x24,
> +=09=09.pwm =3D 0x25,
> +=09},
> +=09{
> +=09=09.temp =3D 0x27,
> +=09=09.pwm =3D 0x2D,
> +=09},
> +=09{
> +=09=09.temp =3D 0x29,
> +=09=09.pwm =3D 0x38,
> +=09},
> +=09{
> +=09=09.temp =3D 0x2C,
> +=09=09.pwm =3D 0x4A,
> +=09},
> +=09{
> +=09=09.temp =3D 0x2F,
> +=09=09.pwm =3D 0x64,
> +=09},
> +};
> [...]
> +static const struct device_config config_table[] =3D {
> +=09{
> +=09=09.vendor_id =3D 0x1b1c,
> +=09=09.product_id =3D 0x0c15,

If I see it correctly, you never use 'vendor_id', nor 'product_id', right?


> +=09=09.fancount =3D 2,
> +=09=09.rpm_min =3D 200,
> +=09=09.rpm_max =3D 3000,
> +=09=09.pwm_max =3D 100,
> +=09=09.name =3D "corsair_H100i_pro",
> +=09=09.hwmon_info =3D dual_fan,
> +=09},
> +};
> [...]
> +
> +#define SUCCES_LENGTH 3
> +#define SUCCES_CODE 0x12, 0x34
> +
> +static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])

I missed this it seems, but my suggestion about the 'static' before the siz=
e
applies here as well.


> +{
> +=09char success[SUCCES_LENGTH] =3D { command, SUCCES_CODE };
> +
> +=09return memcmp(ret, success, SUCCES_LENGTH) =3D=3D 0;
> +}
> +
> +static int acquire_lock(struct hydro_i_pro_device *hdev)
> +{
> +=09int retval =3D usb_autopm_get_interface(hdev->interface);
> +
> +=09if (retval)
> +=09=09return retval;
> +
> +=09mutex_lock(&hdev->io_mutex);
> +=09return 0;

I think this should be

return mutex_lock_interruptible(...);

as per
https://www.kernel.org/doc/html/latest/kernel-hacking/locking.html#locking-=
only-in-user-context


> +}
> [...]
> +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> +=09=09=09      struct hwmon_fan_data *fan_data, u8 val)
> +{
> +=09int retval;
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09fan_data->fan_target =3D 0;
> +=09fan_data->fan_pwm_target =3D val;

Personally, I'd place these two lines at the end of the function so that th=
ey
are not modified if the USB transaction fails.
(same applies to set_fan_pwm_curve() and set_fan_target_rpm())


> +
> +=09send_buf[0] =3D PWM_FAN_TARGET_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +=09send_buf[2] =3D fan_data->fan_pwm_target;
> +=09dev_info(&hdev->udev->dev, "debug:%d,%d,%d", send_buf[0], send_buf[1]=
,
> +=09=09 send_buf[2]);
> +=09dev_info(&hdev->udev->dev, "val:%d", fan_data->fan_pwm_target);

This should be dev_dbg() in my opinion if you intend to have such messages.


> +
> +=09retval =3D transfer_usb(hdev, send_buf, recv_buf, 3, 3);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf)) {
> +=09=09dev_warn(
> +=09=09=09&hdev->udev->dev,
> +=09=09=09"failed setting fan pwm for %s on channel %d %d,%d,%d\n",
> +=09=09=09hdev->config->name, fan_data->fan_channel, recv_buf[0],
> +=09=09=09recv_buf[1], recv_buf[2]);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> [...]
> +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +=09=09       u32 attr, int channel, long val)
> +{
> +=09struct hwmon_data *data =3D dev_get_drvdata(dev);
> +=09struct hydro_i_pro_device *hdev =3D data->hdev;
> +=09struct hwmon_fan_data *fan_data;
> +=09int retval =3D 0;
> +
> +=09switch (type) {
> +=09case hwmon_fan:
> +=09=09switch (attr) {
> +=09=09case hwmon_fan_target:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09if (fan_data->mode !=3D 1)
> +=09=09=09=09return -EINVAL;
> +
> +=09=09=09val =3D clamp_val(val, hdev->config->rpm_min,
> +=09=09=09=09=09hdev->config->rpm_max);
> +
> +=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09if (retval)
> +=09=09=09=09goto exit;
> +
> +=09=09=09retval =3D set_fan_target_rpm(hdev, fan_data, val);
> +=09=09=09if (retval)
> +=09=09=09=09goto cleanup;
> +
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09break;
> +=09case hwmon_pwm:
> +=09=09switch (attr) {
> +=09=09case hwmon_pwm_input:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09if (fan_data->mode !=3D 1)
> +=09=09=09=09return -EINVAL;
> +
> +=09=09=09val =3D clamp_val(val, 0, hdev->config->pwm_max);
> +=09=09=09dev_info(&hdev->udev->dev, "val:%ld", val);

Same here regarding dev_dbg().


> +=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09if (retval)
> +=09=09=09=09goto exit;
> +
> +=09=09=09retval =3D set_fan_target_pwm(hdev, fan_data, val);
> +=09=09=09if (retval)
> +=09=09=09=09goto cleanup;
> +
> +=09=09=09break;
> +=09=09case hwmon_pwm_enable:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +
> +=09=09=09switch (val) {
> +=09=09=09case 2:
> +=09=09=09case 0:
> +=09=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto exit;
> +
> +=09=09=09=09retval =3D set_fan_pwm_curve(hdev, fan_data,
> +=09=09=09=09=09=09=09   DEFAULT_CURVE);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto cleanup;
> +=09=09=09=09fan_data->mode =3D 0;

This could be 'fan_data->mode =3D val', no?


> +=09=09=09=09break;
> +=09=09=09case 1:
> +=09=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto exit;
> +
> +=09=09=09=09if (fan_data->fan_target !=3D 0) {
> +=09=09=09=09=09retval =3D set_fan_target_rpm(
> +=09=09=09=09=09=09hdev, fan_data,
> +=09=09=09=09=09=09fan_data->fan_target);
> +=09=09=09=09=09if (retval)
> +=09=09=09=09=09=09goto cleanup;
> +=09=09=09=09} else if (fan_data->fan_pwm_target !=3D 0) {
> +=09=09=09=09=09retval =3D set_fan_target_pwm(
> +=09=09=09=09=09=09hdev, fan_data,
> +=09=09=09=09=09=09fan_data->fan_pwm_target);
> +=09=09=09=09=09if (retval)
> +=09=09=09=09=09=09goto cleanup;
> +=09=09=09=09}
> +=09=09=09=09fan_data->mode =3D 1;
> +=09=09=09=09break;
> +=09=09=09default:
> +=09=09=09=09return -EINVAL;
> +=09=09=09}
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +cleanup:
> +=09mutex_unlock(&hdev->io_mutex);
> +=09usb_autopm_put_interface(hdev->interface);
> +exit:
> +=09return retval;
> +}
> +
> +static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +=09=09      u32 attr, int channel, long *val)
> +{
> +=09struct hwmon_data *data =3D dev_get_drvdata(dev);
> +=09struct hydro_i_pro_device *hdev =3D data->hdev;
> +=09struct hwmon_fan_data *fan_data;
> +=09int retval =3D 0;
> +
> +=09switch (type) {
> +=09case hwmon_fan:
> +=09=09switch (attr) {
> +=09=09case hwmon_fan_input:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +
> +=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09if (retval)
> +=09=09=09=09goto exit;
> +
> +=09=09=09retval =3D get_fan_current_rpm(hdev, fan_data, val);
> +=09=09=09break;
> +=09=09case hwmon_fan_target:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09if (fan_data->mode !=3D 1) {
> +=09=09=09=09*val =3D 0;
> +=09=09=09=09goto exit;
> +=09=09=09}
> +=09=09=09*val =3D fan_data->fan_target;
> +=09=09=09goto exit;
> +=09=09case hwmon_fan_min:
> +=09=09=09*val =3D hdev->config->rpm_min;
> +=09=09=09goto exit;
> +

Any reason why you don't handle 'hwmon_fan_max' as well?


> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09break;
> +=09case hwmon_pwm:
> +=09=09switch (attr) {
> +=09=09case hwmon_pwm_enable:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09*val =3D fan_data->mode;
> +=09=09=09goto exit;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09goto exit;
> +
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09mutex_unlock(&hdev->io_mutex);
> +=09usb_autopm_put_interface(hdev->interface);
> +exit:
> +=09return retval;
> +}
> +
> +static const struct hwmon_ops i_pro_ops =3D {
> +=09.is_visible =3D hwmon_is_visible,
> +=09.read =3D hwmon_read,
> +=09.write =3D hwmon_write,
> +};
> +
> +static int hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +=09u8 fan_id;
> +=09struct device *hwmon_dev;
> +=09struct hwmon_fan_data *fan;
> +=09struct hwmon_data *data;
> +=09struct hwmon_chip_info *hwmon_info;
> +
> +=09data =3D devm_kzalloc(&hdev->udev->dev, sizeof(*data), GFP_KERNEL);
> +=09hwmon_info =3D devm_kzalloc(&hdev->udev->dev,
> +=09=09=09=09  sizeof(struct hwmon_chip_info), GFP_KERNEL);

I think you missed this 'sizeof' when coverting to 'sizeof(*ptr)'.


> +
> +=09/* You did something bad!! Either adjust  MAX_FAN_COUNT or the fancou=
nt for the config!*/
> +=09WARN_ON(hdev->config->fancount >=3D MAX_PWM_CHANNEL_COUNT);
> +=09data->channel_count =3D
> +=09=09clamp_val(hdev->config->fancount, 0, MAX_PWM_CHANNEL_COUNT);
> +
> +=09/* For each fan create a data channel a fan config entry and a pwm co=
nfig entry */
> +=09for (fan_id =3D 0; fan_id < data->channel_count; fan_id++) {
> +=09=09fan =3D devm_kzalloc(&hdev->udev->dev,
> +=09=09=09=09   sizeof(struct hwmon_fan_data), GFP_KERNEL);

And this one as well.


> +=09=09fan->fan_channel =3D fan_id;
> +=09=09fan->mode =3D 0;
> +=09=09data->channel_data[fan_id] =3D fan;
> +=09}
> +
> +=09hwmon_info->ops =3D &i_pro_ops;
> +=09hwmon_info->info =3D hdev->config->hwmon_info;
> +
> +=09data->hdev =3D hdev;
> +=09hwmon_dev =3D devm_hwmon_device_register_with_info(
> +=09=09&hdev->udev->dev, hdev->config->name, data, hwmon_info, NULL);
> +=09if (IS_ERR(hwmon_dev))
> +=09=09return PTR_ERR(hwmon_dev);
> +
> +=09dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name=
);
> +=09return 0;
> +}

It is still possible that hwmon_init() leaks memory on failure.


> [...]
> +static int astk_probe(struct usb_interface *interface,
> +=09=09      const struct usb_device_id *id)
> +{
> +=09struct hydro_i_pro_device *hdev;
> +=09int retval;
> +=09struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +=09hdev =3D kzalloc(sizeof(*hdev), GFP_KERNEL);
> +
> +=09if (!hdev) {
> +=09=09kfree(hdev);

If this 'if' is taken, then hdev =3D=3D NULL, so no need to free it.


> +=09=09retval =3D -ENOMEM;
> +=09=09goto exit;
> +=09}
> +
> +=09hdev->config =3D (const struct device_config *)id->driver_info;
> +=09/* You should set the driver_info to a pointer to the correct configu=
ration!!*/
> +=09WARN_ON(!hdev->config);
> +
> +=09retval =3D usb_find_common_endpoints(interface->cur_altsetting, &bulk=
_in,
> +=09=09=09=09=09   &bulk_out, NULL, NULL);
> +=09if (retval) {
> +=09=09kfree(hdev);
> +=09=09goto exit;
> +=09}
> +
> +=09hdev->udev =3D usb_get_dev(interface_to_usbdev(interface));
> +=09hdev->interface =3D usb_get_intf(interface);
> +
> +=09/*
> +=09 * set up the endpoint information
> +=09 * use only the first bulk-in and bulk-out endpoints
> +=09 */
> +=09hdev->bulk_in_size =3D usb_endpoint_maxp(bulk_in);
> +=09hdev->bulk_in_buffer =3D kmalloc(hdev->bulk_in_size, GFP_KERNEL);
> +=09hdev->bulk_in_endpointAddr =3D bulk_in->bEndpointAddress;
> +=09hdev->bulk_out_size =3D usb_endpoint_maxp(bulk_out);
> +=09hdev->bulk_out_buffer =3D kmalloc(hdev->bulk_out_size, GFP_KERNEL);

I think both allocations should be checked.


> +=09hdev->bulk_out_endpointAddr =3D bulk_out->bEndpointAddress;
> +
> +=09retval =3D init_device(hdev->udev);
> +=09if (retval) {
> +=09=09dev_err(&interface->dev, "failed initialising %s:%d\n",
> +=09=09=09hdev->config->name, retval);
> +=09=09kfree(hdev);
> +=09=09goto exit;
> +=09}
> +
> +=09retval =3D hwmon_init(hdev);
> +=09if (retval) {
> +=09=09dev_err(&interface->dev, "failed initialising hwmon%s:%d\n",
                                                                  ^^^^^^
I think you need more spaces here.


> +=09=09=09hdev->config->name, retval);
> +=09=09kfree(hdev);
> +=09=09goto exit;
> +=09}
> +
> +=09usb_set_intfdata(interface, hdev);
> +=09mutex_init(&hdev->io_mutex);
> +exit:
> +=09return retval;
> +}
> [...]


Barnab=C3=A1s P=C5=91cze
