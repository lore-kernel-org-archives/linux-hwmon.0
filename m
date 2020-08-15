Return-Path: <SRS0=mGkJ=BZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79912C433E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 23:01:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55889206B6
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 23:01:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ckKEW+A9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgHOXBQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 19:01:16 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:19458 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgHOXBQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 19:01:16 -0400
Date:   Sat, 15 Aug 2020 22:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597532077;
        bh=HluJrWAfkYJCaNQjFLsdpaEWf0n3PrFDezU0LVhEW74=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ckKEW+A9bbOR7JZnroYQCCwrnP9E88Fmx9s5aaTASi/bpKPl9eJHJ6HqWEvaFRI2I
         icKZBcaM5ygDM4ngtIRjY/qAy/0O/vawcJWrBBhGCM/Fn3dM+PMW5MFTAPCoD8zRDc
         cvp4z3r8SC92TZMsWoAzaS90JA8TsS6tKDYLHO7o=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com>
In-Reply-To: <20200815211617.86565-1-jaap.aarts1@gmail.com>
References: <20200815211617.86565-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

there are a couple things that I did not notice in v3, or were introduced i=
n
this version of the patch.


> [...]
> +
> +#define max_fan_count 2
> +#define max_pwm_channel_count max_fan_count
> +

I think these should be all-caps as per
https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enu=
ms-and-rtl


> [...]
> +
> +#define default_curve quiet_curve
> +

I am inclined to say that this should be all-caps as well.


> [...]
> +static int transfer_usb(struct hydro_i_pro_device *hdev,
> +=09=09=09unsigned char *send_buf, unsigned char *recv_buf,
> +=09=09=09int send_len, int recv_len)
> +{
> +=09int retval;
> +=09int wrote;
> +=09int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAd=
dr);
> +=09int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAdd=
r);
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, &wro=
te,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wro=
te,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +=09return 0;

The preceding 5 lines could be simplified to the following:

return usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
=09=09    BULK_TIMEOUT);

And if you don't use 'wrote', you can simply pass 'NULL' as the 5th argumen=
t of
usb_bulk_msg(). Although you should either check the value or set 'recv_buf=
' to
all zeroes in the calling function to avoid the possibility of a failed tra=
nsaction
being recognized as successful.


> +}
> +
> +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> +=09=09=09     struct hwmon_fan_data *fan_data,
> +=09=09=09     struct curve_point point[7])
> +{
> +=09int retval;
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09memcpy(fan_data->curve, point, sizeof(struct curve_point) * 7);
> +

Personally, I'd use 'sizeof(fan_data->curve)' here. And consider making tha=
t
seven a named constant.

Beware that even though the size is there in 'struct curve_point point[7]',
you can still pass arrays that are smaller than that. Consider using
'struct curve_point point[static 7]'.


> +=09send_buf[0] =3D PWM_FAN_CURVE_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +=09send_buf[2] =3D point[0].temp;
> +=09send_buf[3] =3D point[1].temp;
> +=09send_buf[4] =3D point[2].temp;
> +=09send_buf[5] =3D point[3].temp;
> +=09send_buf[6] =3D point[4].temp;
> +=09send_buf[7] =3D point[5].temp;
> +=09send_buf[8] =3D point[6].temp;
> +=09send_buf[9] =3D point[0].pwm;
> +=09send_buf[10] =3D point[1].pwm;
> +=09send_buf[11] =3D point[2].pwm;
> +=09send_buf[12] =3D point[3].pwm;
> +=09send_buf[13] =3D point[4].pwm;
> +=09send_buf[14] =3D point[5].pwm;
> +=09send_buf[15] =3D point[6].pwm;
> +
> +=09retval =3D transfer_usb(hdev, send_buf, recv_buf, 16, 4);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf)) {
> +=09=09dev_warn(
> +=09=09=09&hdev->udev->dev,
> +=09=09=09"failed setting fan pwm/temp curve for %s on channel %d %d,%d,%=
d\n",
> +=09=09=09hdev->config->name, recv_buf[3], recv_buf[0],
> +=09=09=09recv_buf[1], recv_buf[2]);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> +
> [...]
> +
> +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> +=09=09=09      struct hwmon_fan_data *fan_data, u8 val)
> +{
> +=09int retval;
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09fan_data->fan_target =3D 0;
> +=09fan_data->fan_pwm_target =3D val;
> +
> +=09send_buf[0] =3D PWM_FAN_TARGET_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +=09send_buf[3] =3D fan_data->fan_pwm_target;
> +
> +=09retval =3D transfer_usb(hdev, send_buf, recv_buf, 4, 6);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf)) {

Any reason why you don't check recv_buf[3] as in get_fan_current_rpm()?
(same applies to set_fan_pwm_curve() and set_fan_target_rpm())


> +=09=09dev_warn(
> +=09=09=09&hdev->udev->dev,
> +=09=09=09"failed setting fan pwm for %s on channel %d %d,%d,%d\n",
> +=09=09=09hdev->config->name, recv_buf[3], recv_buf[0],
> +=09=09=09recv_buf[1], recv_buf[2]);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> +
> [...]
> +
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
> +=09=09=09if (val < (2 ^ 16) - 2)

Did you intend to write 2 to the power of 16? Because 2^16 is not that.
2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
(you may need to include linux/bits.h for the latter)

But something like this is my suggestion:

if (val < 0 || 0xFFFF < val)
=09return -EINVAL;

Though, I suspect the fans won't go up to 60000 RPM or so.


> +=09=09=09=09return -EINVAL;
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
> +=09=09=09if (val < (2 ^ 8) - 2)

Same here, 2^8 !=3D 2 to the power of 8.

I suggest you simply do something like the following:

if (val < 0 || 0xFF < val)
=09return -EINVAL;


> +=09=09=09=09return -EINVAL;
> +
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
> +=09=09=09case 0:
> +=09=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto exit;
> +
> +=09=09=09=09retval =3D set_fan_pwm_curve(hdev, fan_data,
> +=09=09=09=09=09=09=09   default_curve);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto cleanup;
> +=09=09=09=09fan_data->mode =3D 0;
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
> +=09=09=09case 2:
> +=09=09=09=09retval =3D acquire_lock(hdev);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto exit;
> +
> +=09=09=09=09retval =3D set_fan_pwm_curve(hdev, fan_data,
> +=09=09=09=09=09=09=09   default_curve);
> +=09=09=09=09if (retval)
> +=09=09=09=09=09goto cleanup;
> +=09=09=09=09fan_data->mode =3D 2;
> +=09=09=09=09break;

If I see it correctly, case 0 and case 2 are the basically the same, no?
If so, then you could merge them.


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
> +=09=09=09if (retval)
> +=09=09=09=09goto cleanup;
> +
> +=09=09=09goto cleanup;

The preceding 3 lines can be replaced by a single 'break' given that the
'goto exit' is replaced by a 'break' after the 'switch (attr)'


> +=09=09case hwmon_fan_target:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09if (fan_data->mode !=3D 1) {
> +=09=09=09=09*val =3D 0;
> +=09=09=09=09goto exit;
> +=09=09=09}
> +=09=09=09*val =3D fan_data->fan_target;
> +=09=09=09goto exit;
> +=09=09case hwmon_fan_min:
> +=09=09=09*val =3D 200;
> +=09=09=09goto exit;
> +
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09goto exit;
> +

I don't see why this goto is needed here. It has no effect on the control f=
low.


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
> +cleanup:
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
> +static void hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +=09u8 fan_id;
> +=09struct device *hwmon_dev;
> +=09struct hwmon_fan_data *fan;
> +=09struct hwmon_data *data =3D devm_kzalloc(
> +=09=09&hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
> +=09struct hwmon_chip_info *hwmon_info =3D devm_kzalloc(
> +=09=09&hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
> +
> +=09/* You did something bad!! Either adjust  max_fan_count or the fancou=
nt for the config!*/
> +=09WARN_ON(hdev->config->fancount >=3D max_pwm_channel_count);

If this warning is triggered, then that leads to the overflow of 'data->cha=
nnel_data' later on.


> +=09data->channel_count =3D hdev->config->fancount;
> +
> +=09/* For each fan create a data channel a fan config entry and a pwm co=
nfig entry */
> +=09for (fan_id =3D 0; fan_id < data->channel_count; fan_id++) {
> +=09=09fan =3D devm_kzalloc(&hdev->udev->dev,
> +=09=09=09=09   sizeof(struct hwmon_fan_data), GFP_KERNEL);
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
> +=09dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name=
);
> +}
> +

There is absolutely no error checking in hwmon_init().


> +const int USB_VENDOR_ID_CORSAIR =3D 0x1b1c;
> +const int USB_PRODUCT_ID_H100I_PRO =3D 0x0c15;

I think these should be either - preferably - #define's or 'static' at leas=
t.


> +/*
> + * Devices that work with this driver.
> + * More devices should work, however none have been tested.
> + */
> +static const struct usb_device_id astk_table[] =3D {
> +=09{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
> +=09  .driver_info =3D (kernel_ulong_t)&config_table[0] },
> +=09{},
> +};
> +
> +MODULE_DEVICE_TABLE(usb, astk_table);
> +
> +static int init_device(struct usb_device *udev)
> +{
> +=09int retval;
> +
> +=09/*
> +=09 * This is needed because when running windows in a vm with proprieta=
ry driver
> +=09 * and you switch to this driver, the device will not respond unless =
you run this.
> +=09 */
> +=09retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40=
,
> +=09=09=09=09 0xffff, 0x0000, 0, 0, 0);
> +=09/*this always returns error*/
> +=09if (retval)
> +=09=09;

Shouldn't you check if it's the "good" kind of error?


> +
> +=09retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40=
,
> +=09=09=09=09 0x0002, 0x0000, 0, 0, 0);
> +=09return retval;
> +}
> +
> +static int deinit_device(struct usb_device *udev)
> +{
> +=09return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +=09=09=09       0x0004, 0x0000, 0, 0, 0);
> +}
> +
> +static void astk_delete(struct hydro_i_pro_device *hdev)
> +{
> +=09usb_put_intf(hdev->interface);
> +=09usb_put_dev(hdev->udev);
> +=09kfree(hdev->bulk_in_buffer);
> +=09kfree(hdev->bulk_out_buffer);
> +=09kfree(hdev);
> +}
> +

I think you should call mutex_destroy() in astk_delete().


> +static int astk_probe(struct usb_interface *interface,
> +=09=09      const struct usb_device_id *id)
> +{
> +=09struct hydro_i_pro_device *hdev =3D
> +=09=09kzalloc(sizeof(struct hydro_i_pro_device), GFP_KERNEL);

I think this should be modifed to use 'sizeof(*ptr)' as per
https://www.kernel.org/doc/html/latest/process/coding-style.html#allocating=
-memory
(and everything else that uses the same pattern)



> [...]
> +=09retval =3D init_device(hdev->udev);
> +=09if (retval) {
> +=09=09dev_err(&interface->dev, "failed initialising %s\n",
> +=09=09=09hdev->config->name);

If you print the error code, that helps immensely with troubleshooting.


> +=09=09kfree(hdev);
> +=09=09goto exit;
> +=09}
> +
> +=09hwmon_init(hdev);
> +
> +=09usb_set_intfdata(interface, hdev);
> +=09mutex_init(&hdev->io_mutex);
> +exit:
> +=09return retval;
> +}
> +
> [...]


Barnab=C3=A1s P=C5=91cze
