/* 
* randomizes wallpaper on run 
* this is probably a bad idea 
* but i am too lazy to find a better 
* solution
* */

use std::fs;
use std::path::PathBuf;
use std::process::Command;
use rand::Rng;

fn get_all_images(input_folder: &str) -> Vec<PathBuf> {
        fs::read_dir(input_folder)
        .unwrap()
        .filter_map(|f| f.ok())
        .filter(|f| match f.path().extension() {
            None => false,
            Some(ex) => ex == "jpeg" || ex == "jpg" || ex == "png",
        })
        .map(|f| f.path())
        .collect()
}

fn get_wallpaper_path() -> String {
    let mut home_path = Command::new("sh");
    home_path.arg("-c").arg("echo $HOME");
    let _a = home_path.output().unwrap();
    let home = String::from_utf8(_a.stdout).unwrap(); 
    let _wal = format!("{}/.config/wallpapers", home.strip_suffix("\n").unwrap());
    _wal
} 

fn set_wallpaper(path: &PathBuf) {
    let mut set_wall_cmd = Command::new("sh");
    let image = format!("feh --bg-fill {}", path.to_string_lossy().to_string());
    set_wall_cmd.arg("-c").arg(image).output().unwrap();
}

fn main() {
    let wallpaper_path = get_wallpaper_path();
    let all_imgs = get_all_images(&wallpaper_path);
    let sel_img = &all_imgs[rand::thread_rng().gen_range(0..all_imgs.len())]; 
    // println!("selimg : {:?}", &sel_img); 
    set_wallpaper(&sel_img);
}
