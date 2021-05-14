package edu.depaul.cdm.se452.teamnosleep.hotelreservationsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.depaul.cdm.se452.teamnosleep.hotelreservationsystem.entities.Locations;


public interface LocationsRepository extends JpaRepository<Locations, Integer>  {
    Locations findByLocationName(String location);
}